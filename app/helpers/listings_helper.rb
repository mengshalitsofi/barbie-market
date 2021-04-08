module ListingsHelper
    # def show_product_name(l, index)
    #     l.product.name if index
    # end

    def form_url_helper(product)
        product ? product_listings_path(product) : listings_path
    end    
end