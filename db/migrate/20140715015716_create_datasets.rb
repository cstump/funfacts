class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :type, null: false
      t.string :name
      t.string :uid, null: false
      t.string :url, null: false
      t.timestamps
    end

    add_index :datasets, :uid
  end
end
