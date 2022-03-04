# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated
  # include ShopifyApp::EmbeddedApp
  # include ShopifyApp::EmbeddedApp
  # include ShopifyApp::RequireKnownShop
  # include ShopifyApp::ShopAccessScopesVerification

  helper_method :shop, :shop_domain, :shop_currency

  def shop_domain
    @shop_domain ||= shop_session.url
    # request.env.dig('rack.request.query_hash', 'shop')
  end

  def shop
    Shop.find_by(shopify_domain: shop_domain)
  end

  def shop_currency
    begin
      @shop_current_currency = shop.with_shopify_session do
        money_format = ShopifyAPI::Shop.current.money_format
        currency = ActionView::Base.full_sanitizer.sanitize(money_format).split("{").first.gsub(" ","")
        currency = money_format.split("}").last.gsub(" ","") if currency == ''
        currency
      end
    rescue
      ''
    end
  end

end
