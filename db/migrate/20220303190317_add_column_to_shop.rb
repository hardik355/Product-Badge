class AddColumnToShop < ActiveRecord::Migration[7.0]
  def change
  	add_column :shops, :plan_id, :integer
  end
end
