class ListingsController < ApplicationController
    before_action(:require_login)
    before_action(:set_listing, only: [:edit, :update, :destroy])
    layout "application"

  def index
    if params[:quantity] && params[:quantity] != ""
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
    if params[:product_id] # in case this is coming from the URL
      @listing.product_id = params[:product_id]
    end
    if @listing.save
      redirect_to products_path
    else
       @products = Product.all
       render :new
    end
  end

  def edit
    if @listing == nil
      flash[:message] = "The listing does not exist!"
      redirect_to '/products'
    elsif @listing.user != current_user
      flash[:message] = "That is not your listing!"
      redirect_to '/products'
    else
      @products = Product.all
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to product_path(@listing.product)
    else
      @products = Product.all
      render :edit
    end
  end

  def destroy
    @listing.delete
    redirect_to product_path(@listing.product)
  end

  def max
    @listing = Listing.max_quantity_listing
    render :show
  end

  private

  def set_listing
    @listing = Listing.find_by(id: params[:id])
  end

  def listing_params
    params.require(:listing).permit(:quantity, :product_id)
  end

end
