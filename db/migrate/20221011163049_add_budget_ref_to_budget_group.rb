class AddBudgetRefToBudgetGroup < ActiveRecord::Migration[7.0]
  def change
    add_reference :budgets_groups, :budget, null: false, foreign_key: true
  end
end
