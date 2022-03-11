# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated
  helper_method :shop

  def shop
    @shop ||= Shop.find_by(shopify_domain: shop_domain)
  end

  def shop_domain
    @shop_domain ||= shop_session.url
  end

end
