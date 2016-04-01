class Dmsf::ReportsController < ApplicationController
  # http://psbatishev.narod.ru/1sbuh/b073.htm
  # http://v8.1c.ru/buhv8/ch/ch01.htm?printversion=1

  def analysis
    @net_dt_s = net :debits_account, date: settings.start_date - 1.day
    @net_kt_s = net :credits_account, date: settings.start_date - 1.day
    @dt = by_account :credits_account, entries(:debits_account)
    @kt = by_account :debits_account, entries(:credits_account)
    @korrs = (@dt.keys | @kt.keys).sort_by(&:code)
    @net_dt_e = net :debits_account
    @net_kt_e = net :credits_account
  end

  def turnover
    # {analytic1: {analytic2: amount}}
    @net_dt_s = by_analytics entries(:debits_account, period_start: nil, period_end: settings.start_date - 1.day)
    @net_kt_s = by_analytics entries(:credits_account, period_start: nil, period_end: settings.start_date - 1.day)
    @dt = by_analytics entries(:debits_account)
    @kt = by_analytics entries(:credits_account)
    @net_dt_e = by_analytics entries(:debits_account, period_start: nil)
    @net_kt_e = by_analytics entries(:credits_account, period_start: nil)

    @analytics_tree = [@net_dt_s, @net_kt_s, @dt, @kt, @net_dt_e, @net_kt_e]
        .map { |data| Hash[data.map { |k, v| [k, v.keys] }] }
        .reduce { |data, tree| tree.merge(data) { |k, v1, v2| v1 | v2 } }
  end

  def card
    @net_dt_s = net :debits_account, date: settings.start_date - 1.day
    @net_kt_s = net :credits_account, date: settings.start_date - 1.day
    @saldo = @net_dt_s - @net_kt_s
    @entries = entries(:debits_account).or(entries(:credits_account)).order(:date)
        .includes(:debits_account, :credits_account, document: :analytics)
    @net_dt_e = net :debits_account
    @net_kt_e = net :credits_account
  end

  def balance
  end

  private

  helper_method :account

  def account
    settings.current_account
  end

  def net(side, date: settings.end_date, acc: account)
    entries(side, period_start: nil, period_end: date).sum(:amount)
  end

  def entries(side, period_start: settings.start_date, period_end: settings.end_date, acc: account)
    e = Dmsf::Entry.where(side => acc)
    e = e.where('date >= ?', period_start) if period_start
    e = e.where('date <= ?', period_end) if period_end
    e
  end

  def by_account(kontrside, entries)
    entries.group("#{kontrside}_id").select("#{kontrside}_id", "sum(amount) as amount")
        .includes(kontrside).group_by(&kontrside)
  end

  def by_analytics(entries)
    analytic_type_ids = [account.analytic_type1_id, account.analytic_type2_id]
    analytic_group entries.includes(:document), analytic_type_ids
  end

  def analytic_group(entries, ids)
    if ids.empty?
      entries.sum(&:amount)
    else
      id = ids.shift
      entries.group_by { |e| e.document.analytics.find_by(analytic_type_id: id) }
          .transform_values { |v| analytic_group(v, ids.dup) }
    end
  end
end
