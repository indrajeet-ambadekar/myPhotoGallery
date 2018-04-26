class Photo < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates_processing_of :image
	validate :image_size_validation
	before_save :update_image_attributes
	belongs_to :user

	private
		def image_size_validation
			errors[:image] << "should be less than 500KB" if image.size > 1005.megabytes
		end
		def update_image_attributes
	    if image.present? && image_changed?
	      self.name = image.file.original_filename
	      self.file_type = image.file.content_type
	      self.file_size = image.file.size
	    end
	  end
end

