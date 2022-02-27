# frozen_string_literal: true

class HomeController < AuthenticatedController
  # include ShopifyApp::EmbeddedApp
  # include ShopifyApp::RequireKnownShop
  # include ShopifyApp::ShopAccessScopesVerification

  def index
    p 333333333333333333333333333333
    p shop
    # @shop_origin = current_shopify_domain
    # @host = params[:host]
    p 333333333333333333333333333333
  end
end
