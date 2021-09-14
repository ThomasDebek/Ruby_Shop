class CreateShipments < ActiveRecord::Migration[6.1]
  def change
    create_table :shipments do |t|
      t.string :state, default: 'pending'
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
