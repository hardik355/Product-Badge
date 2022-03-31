# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorageWithScopes

  # RelationShip
  belongs_to :plan, optional: true

  # delegate set for shop.plan_name
  delegate :alias_name, to: :plan, allow_nil: true
  alias_method :plan_name, :alias_name

  def api_version
    ShopifyApp.configuration.api_version
  end
end
