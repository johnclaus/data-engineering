class SubsidiaryData < ActiveRecord::Base
  mount_uploader :uploaded_data, Upload
  
  def process_uploaded_file
    Resque.enqueue(Uploader, self.id)
  end

  def start_processing_time
    self.begin_processing_time = Time.now
    self.save
  end
  
  def finish_processing_time
    self.complete_processing_time = Time.now
    self.save
  end
end