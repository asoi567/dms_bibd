class Dmsf::Setting < ApplicationRecord
  belongs_to :current_account, class_name: 'Dmsf::Account'

  def self.singleton
    first || create(
      current_date: Date.today,
      start_date: Date.today.beginning_of_quarter,
      end_date: Date.today.end_of_quarter,
      current_account: Dmsf::Account.first
    )
  end
end
