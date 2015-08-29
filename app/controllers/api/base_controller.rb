#http://blog.tanookilabs.com/post/95919505408/building-an-api-for-a-mobile-client-with-rails
class Api::BaseController < RocketPants::Base

  before_filter :authenticate_user_from_token
  before_filter :require_authentication!

  def current_user
    @current_user
  end

  protected

    def require_authentication!
      error! :unauthenticated unless current_user
    end

    def authenticate_user_from_token
      user = authenticate_with_http_token do |token, options|
        user_id = options[:user_id]
        user = user_id && User.find_by_id(user_id)

        if user && Devise.secure_compare(user.authentication_token, token)
          user
        else
          nil
        end
      end

      @current_user = user
    end

end