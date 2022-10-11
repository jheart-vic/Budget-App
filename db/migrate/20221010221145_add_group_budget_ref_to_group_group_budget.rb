class AddGroupBudgetRefToGroupGroupBudget < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_group_budgets, :group_budget, null: false, foreign_key: true
  end
end
