class ProductsController < ApplicationController

    before_action(:set_product, except: [:index, :new, :create])
    before_action(:require_login)
  
    layout "application"
  
    def index
      if params[:user_id]
        user = User.find_by(id: params[:user_id])
        @products = user.products.uniq
        @show_all_barbies = false
      else
        @products = Product.all
        @show_all_barbies = true
      end
    end
  
    def show
    end
  
    def new
      @product = Product.new
      @product.listings.build(user: current_user)
      @listings = @product.listings.select{|l| l.user_id == current_user.id}
    end
  
    def create
      @product = Product.new(product_params)
      @product.listings.each {|l| l.user = current_user}

      if @product.save
          redirect_to product_path(@product)
      else
        @listings = @product.listings.select{|l| l.user_id == current_user.id}
        render :new
      end
    end
  
    # def edit
    #     @listings = @product.listings.where(user_id: current_user.id)
    # end
  
    # def update
    #   if @product.update(product_params)
    #     redirect_to(product_path(@product))
    #   else
    #     @listings = @product.listings.select{|l| l.user_id == current_user.id}
    #     render :edit
    #   end
    # end
  
    def destroy
      @product.delete
      redirect_to products_path
    end
    
    private
  
      def product_params
        params.require(:product).permit(:name, :price, listings_attributes: [:quantity, :user_id, :id])
      end
  
      def set_product
        @product = Product.find_by(id: params[:id])
      end
  end  