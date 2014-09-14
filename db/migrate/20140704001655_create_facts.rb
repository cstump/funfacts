class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :region, null: false
      t.decimal :position
      t.string :name, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
