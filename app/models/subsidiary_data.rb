class SubsidiaryData < ActiveRecord::Base
  mount_uploader :uploaded_data, Upload
  def process_uploaded_file; Resque.enqueue(Uploader, self.id); end
  def begin_processing_time; self.update_attributes(begin_processing_time: Time.now); end
  def complete_processing_time; self.update_attributes(complete_processing_time: Time.now); end
  def is_processed?; !!processing_end_time; end
end