# frozen_string_literal: true

class HomeController < AuthenticatedController
  # include ShopifyApp::EmbeddedApp
  # include ShopifyApp::RequireKnownShop
  # include ShopifyApp::ShopAccessScopesVerification

  def index
    @shop_origin = current_shopify_domain
    @host = params[:host]
  end
end
