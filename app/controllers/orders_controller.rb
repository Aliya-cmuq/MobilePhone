class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @title = "Orders"
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  #       @orders = current_user.orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @title = "New Orders"
    
    @phone = Phone.find(params[:id])
    session[:phone] = @phone.id
    @customer = Phone.find(params[:id])
    session[:customer] = @customer.id
    @order = Order.new

    respond_to do |format| 

      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @title = "New Orders"
    
    @order = Order.new(params[:order])
    @order.customer_id = current_customer.id
    @phone = Phone.find(session[:phone])
    @order = @phone.orders.new(params[:order])
    
#    @customer = Customer.find(session[:customer])
#    @order = @customer.orders.new(params[:order])
#    respond_to do |format|
#      if @order.save
#        OrderMailer.new_order_msg(@order).deliver
#	if @phone.quantityInStock > 0 
	 @order = @phone.orders.new(params[:order])
	 # @phone.decrease(@phone.id, @order.quantity) 
     respond_to do |format|
      if @order.save
#	    @phone = @phone.decrease(@phone.id, @order.quantity)
	   
        #OrderMailer.new_order_msg(@order.customer).deliver
        flash[:notice] = "#{@order.id} has been added as a new order and you will be notified by email."
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
#    end
	end
end



  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
