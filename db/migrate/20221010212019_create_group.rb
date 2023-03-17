class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: 'https://img.icons8.com/ios-glyphs/344/person-male.png'

      t.timestamps
    end
  end
end
