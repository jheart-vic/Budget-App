class GroupBudget < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :groups

  validates :name, presence: true
end
