class ListingsController < ApplicationController
    before_action(:require_login)
    layout "application"

  def index
    if params[:quantity]
      @listings = Listing.quantity_search(params[:quantity])
    else
      @listings = Listing.all
    end
  end

  def new
    if params[:product_id]
      @product = Product.find_by(id: params[:product_id])
      @listing = @product.listings.build
      @products = Product.all
    else
      @listing = Listing.new
      @products = Product.all
    end
  end

  def create
    @listing = Listing.create(listing_params)
    @listing.user = current_user
    if params[:product_id]
      @listing.product_id = params[:product_id]
    end
    if @listing.save
      redirect_to products_path
    else
       @products = Product.all
       render :new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:quantity, :product_id)
  end

end
