class FixNameOfUnitPriceColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :line_items, :unit_pricce, :unit_price
  end
end
