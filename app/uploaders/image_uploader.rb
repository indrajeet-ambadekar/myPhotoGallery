# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::Audio
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  version :thumb, :if => :video? do
    process thumbnail: [{format: 'png', quality: 7, size: 640, strip: false, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
    process :set_content_type_png
  end

  def png_name for_file, version_name
    %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end

  def set_content_type_png(*args)
    Rails.logger.debug "#{file.content_type}"
    self.file.instance_variable_set(:@content_type, "image/png")
  end

  version :micro_thumb, :if => :image? do
    process :resize_to_fill => [300, 300]
  end
  version :nano_thumb, :if => :image? do
    process :resize_to_fill => [150, 150]
  end
  version :thumb, :if => :image? do
    process :resize_to_fill => [400, 400]
  end
  version :mp3, :if => :audio? do
    process :convert => [{output_format: :mp3}]

    def full_filename(for_file)
      "#{super.chomp(File.extname(super))}.mp3"
    end
  end

  protected
  def image?(new_file)
    new_file.content_type.include? 'image'
  end
  def video?(new_file)
    new_file.content_type.include? 'video'
  end
  def audio?(new_file)
    new_file.content_type.include? 'audio'
  end
  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png mp3 mpeg mp4 avi flv)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
