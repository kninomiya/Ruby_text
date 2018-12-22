# project_id = "Your Google Cloud project ID"
# image_path = "Path to local image file, eg. './image.png'"

require "google/cloud/vision"

# Your Google Cloud Platform project ID
project_id = "polynomial-net-212709"

vision = Google::Cloud::Vision.new project: project_id
image  = vision.image "./val.jpeg"
puts image.text

