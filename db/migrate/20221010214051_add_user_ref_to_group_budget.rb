class AddUserRefToGroupBudget < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_budgets, :user, null: false, foreign_key: true
  end
end
