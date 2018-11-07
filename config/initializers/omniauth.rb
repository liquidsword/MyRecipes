Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['43a7356e4d0b4b24ce8c'], ENV['
a2ceb543d2826d9a70c67bbe0cfb2df3196bc446']
end
