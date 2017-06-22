#ActionController::Base.asset_host = Proc.new { |source|
#  if source.ends_with?('.css')
#    "https://photo-app-asatchwill.herokuapp.com"
#  else
#    "https://s3-us-east-2.amazonaws.com/photoappimagesbucket"
#  end
#}

#image_tag("rails.png")
# => <img alt="Rails" src="http://assets.example.com/assets/rails.png" />
#stylesheet_link_tag("application")
# => <link href="http://myapp.herokuapp.com/assets/application.css" media="screen" rel="stylesheet" />


if Rails.env.production?
    CarrierWave.configure do |config|
        config.fog_credentials = {
            :provider => 'AWS',
            :aws_access_key_id => ENV['S3_KEY'],
            :aws_secret_access_key => ENV['S3_SECRET']
        }
    config.fog_directory = ENV['S3_BUCKET']
    end
end