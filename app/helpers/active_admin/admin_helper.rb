module ActiveAdmin::AdminHelper

  def form_title(model_name)
    I18n.t('forms.title', model_name: model_name)
  end

end