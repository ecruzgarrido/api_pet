module AuthorizationHelper

  def authentication_token(user, token=nil)
    authorization_token = token || user.authentication_token
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(authorization_token, user_id: user.id)
  end

end