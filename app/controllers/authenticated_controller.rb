# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  # include ShopifyApp::Authenticated
  include ShopifyApp::EmbeddedApp
  include ShopifyApp::RequireKnownShop
  include ShopifyApp::ShopAccessScopesVerification

  helper_method :shop, :shop_domain

  def shop_domain
    # p 11111111111111111111111111111111
    request.env.dig('rack.request.query_hash', 'shop')
    # p 11111111111111111111111111111111
  end

  def shop
    # p 22222222222222222222222222222222
    # p shop_domain
      Shop.find_by(shopify_domain: shop_domain)
    # p 22222222222222222222222222222222
  end

end
