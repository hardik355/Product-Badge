# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated
  include ShopifyApp::EmbeddedApp

  # include ShopifyApp::EmbeddedApp
  # include ShopifyApp::RequireKnownShop
  # include ShopifyApp::ShopAccessScopesVerification

  helper_method :shop, :shop_domain

  def shop_domain
    @shop_domain ||= shop_session.url
    # request.env.dig('rack.request.query_hash', 'shop')
  end

  def shop
    Shop.find_by(shopify_domain: shop_domain)
  end

end
