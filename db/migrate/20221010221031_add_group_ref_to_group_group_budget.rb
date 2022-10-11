class AddGroupRefToGroupGroupBudget < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_group_budgets, :group, null: false, foreign_key: true
  end
end
