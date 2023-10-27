class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  # GET /orders/new
  def new
    @order = Order.new
    @plant = Plant.find(params[:plant_id])
  end

  # GET /orders/1/edit
  def edit; end

  def create
    user = User.find_by(email: params[:email])

    unless user
      # Redirect to the new user registration form if the user is not found.
      redirect_to new_user_path(email: params[:email])
      return
    end

    @order = user.orders.create!
    @order.order_items.create!(plant_id: params[:plant_id], quantity: 1,
                               unit_price: Plant.find(params[:plant_id]).price)

    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id)
  end
end
