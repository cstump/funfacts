class CreateDatasetsFunFacts < ActiveRecord::Migration
  def change
    create_table :datasets_fun_facts, id: false do |t|
      t.integer :dataset_id
      t.integer :fun_fact_id
    end

    add_index :datasets_fun_facts, :dataset_id
    add_index :datasets_fun_facts, :fun_fact_id
  end
end
