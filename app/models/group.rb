class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :budgets, dependent: :delete_all

  validates :name, presence: true, length: { in: 3..30 }
end
