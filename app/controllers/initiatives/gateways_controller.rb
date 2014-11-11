class Initiatives::GatewaysController < StateController

  before_action :set_initiative
  before_action :set_gateway, except: %i[new create]

  respond_to :html

  after_action :verify_policy_scoped, only: %i[]

  def new
    @gateway = @initiative.gateways.new
    authorize @gateway
    module_names = @initiative.gateways.map(&:module_name)
    @gateways = @initiative.available_gateways
    respond_with @gateway
  end

  def create
    @gateway = @initiative.gateways.new(gateway_params)
    @gateways = @initiative.available_gateways
    authorize @gateway
    @gateway.save
    respond_with @gateway, location: -> { @initiative }
  end

  def edit
    authorize @gateway
  end

  def update
    authorize @gateway
    @gateway.update(gateway_params)
    respond_with @gateway, location: -> { @initiative }
  end

  def use_production
    transition_state(:use_production)
  end

  def use_sandbox
    transition_state(:use_sandbox)
  end

  def revert_to_draft
    transition_state(:revert_to_draft)
  end

  private

  def set_initiative
    @initiative = Initiative.find(params[:initiative_id])
  end

  def set_gateway
    @gateway = @initiative.gateways.find(params[:id])
  end

  def gateway_params
    params.require(:gateway).permit(*policy(@gateway || Gateway.new).permitted_attributes)
  end

  def transition_state(transition)
    super(@gateway, transition, @initiative)
  end

end
