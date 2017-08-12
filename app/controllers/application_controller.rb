class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :authenticate

    def authenticate
      if Rails.env == 'production'
        authenticate_or_request_with_http_basic do |user, password|
          user == "steve" && password == ENV['PASSWORD']
        end
      end
    end
end
