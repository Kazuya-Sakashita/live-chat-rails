# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors



Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # 今回はRailsのポートが3001番、Reactのポートが3000番にするので、Reactのリクエストを許可するためにlocalhost:3000を設定
    origins 'localhost:8080'
    resource '*',
             :headers => :any,
             # この一文で、渡される、'access-token'、'uid'、'client'というheaders情報を用いてログイン状態を維持する。
             :expose => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
             :methods => [:get, :post, :options, :delete, :put]
  end
end
