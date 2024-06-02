# frozen_string_literal: true

# Carts Controller
class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[show edit update destroy order checkout]

  # GET /carts or /carts.json
  def index
    redirect_to root_path
  end

  # GET /carts/1 or /carts/1.json
  def show; end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was emptied.' }
      format.json { head :no_content }
    end
  end

  # GET /carts/1/order
  def order
    if @cart.line_items.empty?
      redirect_to root_path, alert: 'Cart is empty.'
    else
      render :checkout
    end
  end

  # POST /carts/1/checkout
  def checkout
    @cart.assign_attributes(cart_params)
    if @cart.valid?(:checkout) && @cart.save
      @cart.update(completed: true, processed_at: Time.now)
      session[:cart_id] = nil
      redirect_to root_path, notice: "Thank you for your order! It will be shipped to #{@cart.address} in 24 hours."
    else
      render :checkout, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:address, :phone_number, :credit_card_number)
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to root_url, notice: 'Oops, something went wrong. Please try again.'
  end
end
