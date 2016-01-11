Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '442242635964249', 'f63d70c62cbe3175b693b878dbe39e87',
           :scope => 'email,user_birthday', :display => 'popup'
end