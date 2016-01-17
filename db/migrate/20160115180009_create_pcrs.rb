class CreatePcrs < ActiveRecord::Migration
  def change
    create_table :pcrs do |t|
      t.integer :gene_id
      t.string :fragment_name
      t.string :product_size
      t.string :final_vector
      t.string :machine
      t.string :enzyme
      t.integer :break
      t.integer :break_t
      t.integer :denature
      t.integer :denature_t
      t.integer :annealing
      t.integer :annealing_t
      t.integer :elongation
      t.integer :elongation_t
      t.integer :polya
      t.integer :polya_t
      t.integer :cycles

      t.timestamps null: false
    end
  end
end
