class CreateAddressSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :address_sellers do |t|
      t.string   :postal_code,         null: false
      t.string   :area,             null: false
      t.string   :city,        null: false
      t.string   :block_number,        null: false
      t.string   :house_number 
      t.string   :phone_number,        null: false
      t.references :seller,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
