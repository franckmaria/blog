class DescriptionsController < ApplicationController
  before_action :authenticate_devise_api_token!, only: %i[create get_description]
  before_action :set_description, only: %i[show update destroy]

  # GET /descriptions
  def index
    @descriptions = Description.all

    render json: @descriptions
  end

  # GET /descriptions/1
  def show
    render json: @description
  end

  def get_description
    devise_api_token = current_devise_api_token
    @user = User.find(devise_api_token.resource_owner.id.to_i)
    @description = @user.descriptions.first
    render json: @description
  end

  # POST /descriptions
  def create
    devise_api_token = current_devise_api_token
    @description = User.find(devise_api_token.resource_owner.id.to_i).descriptions.new(description_params)

    if @description.save
      render json: @description, status: :created, location: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /descriptions/1
  def update
    if @description.update(description_params)
      render json: @description
    else
      render json: @description.errors, status: :unprocessable_entity
    end
  end

  # DELETE /descriptions/1
  def destroy
    @description.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_description
    @description = Description.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def description_params
    params.require(:description).permit(:name, :descriptionUser)
  end
end
