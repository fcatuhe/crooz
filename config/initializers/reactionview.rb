return unless Rails.env.development?

ReActionView.configure do |config|
  # Intercept .html.erb templates to use Herb::Engine
  config.intercept_erb = true

  # Enable debug mode
  config.debug_mode = true # Rails.env.development?
end
