class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :species
      t.string :number
      t.string :name
      t.string :size

      t.timestamps null: false
    end
  end
end
