ShopifyApp.configure do |config|
  config.application_name = "Product Badge"
  
  config.api_key = Rails.application.credentials.send("#{Rails.env}")[:SHOPIFY_API_KEY]
  config.secret = Rails.application.credentials.send("#{Rails.env}")[:SHOPIFY_API_SECRET]
  config.scope = "read_products, read_orders, read_products, write_products, read_script_tags, write_script_tags"  
  
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2022-10"
  config.shop_session_repository = 'Shop'

  config.reauth_on_access_scope_changes = true
  config.allow_jwt_authentication = true
  # config.allow_cookie_authentication = false

  topics = %w[app/uninstalled]
  config.webhooks = topics.each_with_object([]) do |topic, a|
    options = {
      topic: topic,
      format: "json",
      address: "#{Rails.application.credentials.send("#{Rails.env}")[:HOST]}/webhooks/#{topic.parameterize(separator: '_')}"
    }
    a << options
  end
end
