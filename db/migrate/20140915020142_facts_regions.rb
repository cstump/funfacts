class FactsRegions < ActiveRecord::Migration
  def change
    create_table :facts_regions, id: false do |t|
      t.integer :fact_id, null: false
      t.integer :region_id, null: false
    end

    add_index :facts_regions, :fact_id
    add_index :facts_regions, :region_id
  end
end
