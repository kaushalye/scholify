Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
           {
             scope: 'profile, email',
             access_type: 'online',
             image_aspect_ratio: 'square',
             image_size: 32,
             name: 'google',
             client_options: {:ssl =>
                                { :verify => !Rails.env.development?}
                              }
           }
end
