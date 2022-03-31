class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
    	t.string :title
      t.decimal :price
      t.integer :alias_name
      t.string :descriptions
      t.text :key_points

      t.timestamps
    end
  end
end
