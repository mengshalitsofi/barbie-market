module ListingsHelper
    def show_product_name(l, index)
        l.product.name if index
    end
end