class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create!(allow_params)
    redirect_to :root
  end

  private
  def allow_params
    params.require(:product).permit(:name, :tagline)
  end
end