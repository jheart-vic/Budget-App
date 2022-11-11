class CreateBudgetGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets_groups, &:timestamps
  end
end
