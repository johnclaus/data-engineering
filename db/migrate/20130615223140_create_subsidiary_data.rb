class CreateSubsidiaryData < ActiveRecord::Migration
  def change
    create_table :subsidiary_data do |t|
      t.string :uploaded_data
      t.datetime :begin_processing_time
      t.datetime :complete_processing_time
    end
  end
end
