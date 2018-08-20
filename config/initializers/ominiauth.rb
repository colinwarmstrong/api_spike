Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '76e545e9d5119d99ec95', '42efc14251405caf93102ba5f3f80888fd773149', scope: 'user,repo,gist'
end
