class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :budgets
  has_many :budgets_group, dependent: :delete_all, foreign_key: 'group_id'

  validates :name, presence: true, length: { in: 3..30 }
  validates :icon, presence: true
end
