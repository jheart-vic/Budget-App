class GroupGroupBudget < ApplicationRecord
  belongs_to :groups, class_name: 'Group'
  belongs_to :group_budgets, class_name: 'Group_Budget'
end
