class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :species
      t.string :number
      t.string :gene_name	
      t.string :size
      t.text :sequence
      t.timestamps null: false
    end
  end
end
