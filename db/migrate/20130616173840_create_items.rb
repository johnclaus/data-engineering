class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :price_cents
      t.string :currency_type
      t.integer :merchant_id
    end
  end
end
