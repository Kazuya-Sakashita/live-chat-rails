module Overrides
  class CustomSessionsController < DeviseTokenAuth::SessionsController
    after_action :debug_headers, only: [:create]

    def create
      # カスタムのロジック
      super # 元のcreateアクションを呼び出す
      Rails.logger.debug(response.headers)
    end

    private

    def debug_headers
      puts response.headers
    end

    def sign_in_params
      params.permit(:email, :password)
    end
  end


end
