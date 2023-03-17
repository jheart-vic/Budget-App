class BudgetGroup < ApplicationRecord
  belongs_to :group, class_name: 'Group'
  belongs_to :budget, class_name: 'Budget'
end
