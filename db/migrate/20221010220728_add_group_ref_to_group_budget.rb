class AddGroupRefToGroupBudget < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_budgets, :group, null: false, foreign_key: true
  end
end
