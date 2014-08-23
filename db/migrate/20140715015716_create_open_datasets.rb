class CreateOpenDatasets < ActiveRecord::Migration
  def change
    create_table :open_datasets do |t|
      t.string :type, null: false
      t.string :name
      t.string :uid, null: false
      t.string :url, null: false
      t.timestamps
    end

    add_index :open_datasets, :uid
  end
end
