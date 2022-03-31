class ChargeCreator
  # constants
  APP_NAME = 'ProductBadge'

  def initialize(return_url, shop, plan)
    @return_url = return_url
    @shop = shop
    @plan = plan
  end

  def call
    ShopifyAPI::RecurringApplicationCharge.new(name: APP_NAME,
                                               price: @plan.price.to_f,
                                               test: test_charge?,
                                               trial_days: trial_period,
                                               return_url: "#{@return_url}?plan_id=#{@plan.id}")
  end

  def test_charge?
    Rails.env.development? || Rails.env.staging? || testing_domain.include?(@shop.shopify_domain)
  end

  def trial_period
    if ((@plan.title == 'silver') || (@plan.title == 'gold') || (@plan.title == 'platinum'))
      free_15_day_trial_shop.include?(@shop.shopify_domain) ? 15 : 5
    else
      0
    end
  end

  def testing_domain
    %w[essence-developer-5-ha.myshopify.com]
  end

  def free_15_day_trial_shop
    %w[essence-developer-5-ha.myshopify.com]
  end
  
end
