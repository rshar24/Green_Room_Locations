class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :avatar do
    cloudinary_transformation radius: 20, width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
