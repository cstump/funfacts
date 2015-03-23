class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
