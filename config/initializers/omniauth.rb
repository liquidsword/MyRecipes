Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '43a7356e4d0b4b24ce8c', 'a2ceb543d2826d9a70c67bbe0cfb2df3196bc446'
end
