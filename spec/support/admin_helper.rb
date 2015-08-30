module AdminHelper

  def sign_in_admin
    @admin = Admin.make!
    sign_in @admin
  end

  def just_sign_in_admin
    @admin = Admin.first || Admin.make!
    sign_in @admin
  end

end
