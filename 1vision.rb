# Imports the Google Cloud client library
require "google/cloud/vision"

# Your Google Cloud Platform project ID
project_id = "polynomial-net-212709"

# Instantiates a client
vision = Google::Cloud::Vision.new project: project_id

# The name of the image file to annotate
file_name = "./003.jpg"

# Performs label detection on the image file
labels = vision.image(file_name).labels

puts "Labels:"
labels.each do |label|
  puts label.description
  puts label
  if label.score > 0.7 then
    p "ok"
  end
end


