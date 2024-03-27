class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: %i[show update destroy]
  before_action :authenticate_devise_api_token!, only: [:create]
  # GET /paragraphs
  def index
    @paragraphs = Paragraph.all

    render json: @paragraphs
  end

  # GET /paragraphs/1
  def show
    render json: @paragraph
  end

  # POST /paragraphs
  def create
    devise_api_token = current_devise_api_token
    @user = User.find(devise_api_token.resource_owner.id.to_i)
    @post = @user.posts.last
    @paragraph = @post.paragraphs.new(paragraph_params)

    if @paragraph.save
      render json: @paragraph, status: :created, location: @paragraph
    else
      render json: @paragraph.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paragraphs/1
  def update
    if @paragraph.update(paragraph_params)
      render json: @paragraph
    else
      render json: @paragraph.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paragraphs/1
  def destroy
    @paragraph.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_paragraph
    @paragraph = Paragraph.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def paragraph_params
    params.require(:paragraph).permit(:title, :content)
  end
end
