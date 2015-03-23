class ColumnsDatasets < ActiveRecord::Migration
  def change
    create_table :columns_datasets, id: false do |t|
      t.integer :dataset_id, null: false
      t.integer :column_id, null: false
    end

    add_index :columns_datasets, :dataset_id
    add_index :columns_datasets, :column_id
  end
end
