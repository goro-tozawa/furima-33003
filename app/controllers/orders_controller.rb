class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_items, only: [:index, :create, :move_to_index]
  before_action :sold_out, only: [:index]
  before_action :move_to_index, only: [:index]
  
  def index
    @user_purchase = UserPurchase.new
  end
  
  def create
    @user_purchase = UserPurchase.new(order_params)
    
    if @user_purchase.valid?
      card_item
      @user_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

    def move_to_index
      if current_user.id == @item.user_id
        redirect_to root_path
      end
    end

  
  private
    def order_params
      params.require(:user_purchase).permit(:postal_code, :area_id, :municipality, :house_number, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end
      def card_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'               
      )
      end
      
      def set_items
        @item = Item.find(params[:item_id])
      end

      def sold_out
        if @item.purchase.present?
          redirect_to root_path
        end
      end
end


