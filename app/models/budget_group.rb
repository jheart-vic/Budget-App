class BudgetGroup < ApplicationRecord
  belongs_to :groups, class_name: 'Group'
  belongs_to :budgets, class_name: 'Budget'
end
