class CreateFunFactsOpenDatasets < ActiveRecord::Migration
  def change
    create_table :fun_facts_open_datasets, id: false do |t|
      t.integer :open_dataset_id
      t.integer :fun_fact_id
    end

    add_index :fun_facts_open_datasets, :open_dataset_id
    add_index :fun_facts_open_datasets, :fun_fact_id
  end
end
