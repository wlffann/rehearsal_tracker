Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    :response_type => 'code',
    :scope => 'openid,email,profile',
    :image_aspect_ratio => 'square',
    :image_size => 50
  }
end
