class PlansController < AuthenticatedController

	def index
  end

  def create
  	# session = ShopifyAPI::Session.new(domain: "product-sticker.myshopify.com", token: Shop.first.shopify_token, api_version: "2019-10")
		# ShopifyAPI::Base.activate_session(session)  
		# ShopifyAPI::Base.api_version = '2020-01'
		#shop = ShopifyAPI::Shop.current
	    plan = Plan.find_by(alias_name: params[:alias_name])
	    if plan.alias_name == 'free'
	      shop.update(plan_id: plan.id)
	      current_charge.destroy if current_charge.present?
	      redirect_to root_path
	    else
	      charge = ChargeCreator.new(charges_url, shop, plan).call
	      fullpage_redirect_to charge.confirmation_url if charge.save
	  	end 
    # end
  end

  private

  def current_charge
    shop.with_shopify_session do
      ShopifyAPI::RecurringApplicationCharge.current
    end
  end

end
