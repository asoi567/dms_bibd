class Dmsf::ReportsController < ApplicationController
  # http://psbatishev.narod.ru/1sbuh/b073.htm
  # http://v8.1c.ru/buhv8/ch/ch01.htm?printversion=1

  def analysis
    @net_dt_s = net :debits_account, settings.start_date - 1.day
    @net_kt_s = net :credits_account, settings.start_date - 1.day
    @dt = by_account :credits_account, entries(:debits_account)
    @kt = by_account :debits_account, entries(:credits_account)
    @korrs = (@dt.keys | @kt.keys).sort_by(&:code)
    @net_dt_e = net :debits_account
    @net_kt_e = net :credits_account
  end

  def turnover
  end

  def card
  end

  def balance
  end

  private

  helper_method :account

  def account
    settings.current_account
  end

  def net(side, date = settings.end_date, acc = account)
    Dmsf::Entry.where(side => acc).where('date <= ?', date).sum(:amount)
  end

  def entries(side, acc = account, period = settings.start_date..settings.end_date)
    Dmsf::Entry.where(side => acc).where(date: period)
  end

  def by_account(side, entries)
    entries.group("#{side}_id").select("#{side}_id", "sum(amount) as amount").includes(side).group_by(&side)
  end
end
