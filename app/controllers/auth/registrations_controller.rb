class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
    after_action :log_headers
    private

    def sign_up_params
      params.require(:registration).permit(:name, :email, :password, :password_confirmation)
    end

    def log_headers
      puts "Response Headers: #{response.headers.to_h}"
    end
end
