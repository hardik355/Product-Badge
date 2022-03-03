# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  # RelationShip
  belongs_to :plan, optional: true


  def api_version
    ShopifyApp.configuration.api_version
  end
end
