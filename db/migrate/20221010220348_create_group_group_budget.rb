class CreateGroupGroupBudget < ActiveRecord::Migration[7.0]
  def change
    create_table :group_group_budgets do |t|

      t.timestamps
    end
  end
end
