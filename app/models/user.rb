class User < ApplicationRecord
  has_many :groups, foreign_key: 'user_id'
  has_many :group_budgets, foreign_key: 'user_id'

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }

end
