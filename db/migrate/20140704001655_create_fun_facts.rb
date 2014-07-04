class CreateFunFacts < ActiveRecord::Migration
  def change
    create_table :fun_facts do |t|
      t.decimal :position
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
