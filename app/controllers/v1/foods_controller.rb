class V1::FoodsController < ApplicationController
	before_action :set_food, only: [:show, :update, :destroy]

	def index
		@foods = Food.all	
		render json: {
			status: 'OK',
			result: @foods
		}, status: :ok
	end

	def create
		@food = Food.new(food_params) 

      if @food.save 
        render json: {
          status: 'OK', 
          message: 'Saved food',  
          result:@food
        },status: :ok
      else 
        render json: {
          status: 'ERROR', 
          message: 'food not saved.',  
          result:@food.errors
        }, status: :unprocessable_entity 
      end 
    end 

    def show #menampilkan by id api/v1/foods/1 
      render json: {
        status: 'OK', 
        result:@food
      },status: :ok
    end 

    def destroy #hapus data DELETE http://api/v1/1 //delete by id 
      @food=Food.find(params[:id]) 
      @food.destroy 
      render json: {
        status: 'OK', 
        message: 'food has been deleted'
      },status: :ok, :except => [:created_at, :updated_at] 
    end 

    def update #PUT/PATCH http://api/v1/1?params 
      if @food.update(food_params) 
        render json: {
          status: 'OK', 
          message: 'Data has been updated',  
          result:@food
        }, status: :ok, :except => [:created_at, :updated_at] 
      end 
    end 

	private 

      def food_params 
        params.permit(:name, :price, :photo) 
      end 

      def set_food 
        @food = Food.find(params[:id]) 
      end 
end