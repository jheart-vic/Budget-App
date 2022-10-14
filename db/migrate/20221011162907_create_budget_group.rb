class CreateBudgetGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets_groups do |t|

      t.timestamps
    end
  end
end
