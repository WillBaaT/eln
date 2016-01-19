class CreatePrimers < ActiveRecord::Migration
  def change
    create_table :primers do |t|

      t.timestamps null: false
    end
  end
end
