module UserHelper

  def generate_user
    User.make!
  end

  def generate_user_with_authentication_token
    user = generate_user
    user.generate_authentication_token
    user.reload
  end
end
