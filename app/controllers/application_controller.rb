class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #http://guides.rubyonrails.org/v3.2.8/i18n.html#setting-and-passing-the-locale
  #Set i18n locale
  before_action :set_locale

  protected

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
end
