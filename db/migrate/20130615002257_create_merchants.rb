class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.text :name
      t.text :address
    end
  end
end
