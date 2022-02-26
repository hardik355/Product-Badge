# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  include ShopifyApp::Authenticated

  helper_method :shop


  def shop
    p 11111111111111111111111111111
    p params
    p 22222222222222222222222222
  end
end
