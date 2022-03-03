class PlansController < AuthenticatedController

	def index
  end

  def create
    plan = Plan.find_by(alias_name: params[:alias_name])
    if plan.alias_name == 'free'
      shop.update(plan_id: plan.id)
      update_bundle_products
      current_charge.destroy if current_charge.present?
      redirect_to root_path
    else
    	p 11111111111111111111111111
      @charge = ::ChargeCreator.new(charges_url, shop, plan).call
      fullpage_redirect_to @charge.confirmation_url if @charge.save
    end
  end

  private

  def current_charge
    shop.with_shopify_session do
      ShopifyAPI::RecurringApplicationCharge.current
    end
  end

end
