require 'csv'
class Uploader
  @queue = "uploader"

  def self.logger
    Rails.logger
  end
  
  def self.perform(subsidiary_data_id)
    subsidiary_data = SubsidiaryData.find(subsidiary_data_id)
    subsidiary_data.start_processing_time
    process_csv(subsidiary_data.uploaded_data.current_path)
    subsidiary_data.finish_processing_time
  end
  
  def self.process_csv(upload_file_path)
    CSV.foreach(upload_file_path, headers: true, col_sep: "\t", ) do |row|
      merchant_data = {name: row["merchant name"], address: row["merchant address"]}
      item_data = {description: row["item description"], price: row["item price"]}
      purchaser_data = {name: row["purchaser name"]}
      purchase_count = row["purchase count"]

      begin
        merchant = Merchant.where(merchant_data).first
        merchant = Merchant.create!(merchant_data) unless merchant
        
        item = Item.where(merchant_id: merchant, description: item_data[:description]).first
        item = Item.create!(item_data.merge(merchant: merchant)) unless item

        purchaser = Purchaser.where(purchaser_data).first
        purchaser = Purchaser.create!(purchaser_data) unless purchaser

        purchase_count.to_i.times do
          Purchase.create!(purchaser: purchaser, item: item)
        end
      rescue ActiveRecord::RecordInvalid => e
        logger.error e.inspect
      end
    end
  end
end
