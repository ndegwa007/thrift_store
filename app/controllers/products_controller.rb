class ProductsController < ApplicationController
  before_action	:set_product, only: %i[show edit update destroy]
  allow_unauthenticated_access only: %i[index show]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
   @product = Product.new(product_params)
   if @product.save
    redirect_to @product
   else
    render :new, status: unprocessable_entity
   end
  end

  def edit
  end

  def update
   if params[:product][:images].present?
     @product.images.purge # remove existing images
   end

   if @product.update(product_params)
    redirect_to @product, notice: "Product successfully updated"
   else
    render :edit, status: :unprocessable_entity
   end
  end

  def destroy
   @product.destroy
   redirect_to products_path
  end

  private
   def set_product
    @product = Product.find(params[:id])
   end

   def product_params
    params.require(:product).permit(:name, :description, :inventory_count, images: [])
   end
end
