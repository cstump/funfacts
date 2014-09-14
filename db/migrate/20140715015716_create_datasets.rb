class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :uri, null: false
      t.timestamps
    end

    add_index :datasets, :name
    add_index :datasets, :provider
  end
end
