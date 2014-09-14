class CreateDatasetsFacts < ActiveRecord::Migration
  def change
    create_table :datasets_facts, id: false do |t|
      t.integer :dataset_id
      t.integer :fact_id
    end

    add_index :datasets_facts, :dataset_id
    add_index :datasets_facts, :fact_id
  end
end
