class OrdersController < ApplicationController
  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(order_params)
    if @user_purchase.save
       redirect_to root_path
    else
       render action: :new
    end
  end
  
  private
  def order_params
    params.require(:user_purchase).permit(:postal_code, :area_id, :municipality, :house_number, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
