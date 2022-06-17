class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy add_to_cart]
  before_action :find_category
  # GET /products or /products.json
  def index
    #@products = Product.all
    @products = @category.products

  end



  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new({:category_id => @category_id})
  end
  def add_to_cart
    @category_id = @product.category_id

    if user_signed_in?
      if @product.avatar.attached?
        @cart = Cart.create(:user_id=>current_user.id, :product_id=>@product.id,:category_id=>@category_id, :quantity=> 1,:price=>@product.price)
      end
      respond_to do |format|
        format.html { redirect_to products_url(:category_id=>@category_id), notice: "Product is successfully added to cart." }
        format.json { head :no_content }
      end
    else
      redirect_to new_user_registration_path
    end
    # params.require(:cart).permit(:user_id, :product_id, :category_id, :quantity, :total_price))
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create

    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @category_id=@product.category_id
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url(:category_id=>@category_id), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :category_id, :description,  :price, :avatar)
    end

   def find_category
      if params[:category_id]
        @category = Category.find(params[:category_id])
      end
end

end
