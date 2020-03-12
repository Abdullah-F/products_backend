class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :code
      t.boolean :active, default: false
      t.float :discount, default: 0.0

      t.timestamps
    end
  end
end
