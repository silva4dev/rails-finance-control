class BillsController < ApplicationController
	before_action :set_bill, only: [:edit, :update, :destroy]

	def index
		@bills = Bill.all
	end

	def new
		@bill = Bill.new
		@categories = Category.all
	end

	def edit
		@categories = Category.all
	end

	def create
		@bill = Bill.new(bills_params)
		respond_to do |format|
			if @bill.save
				format.html { redirect_to bills_url }
			end
		end
	end

	def update
		respond_to do |format|
			if (@bill.update(bills_params))
				format.html { redirect_to bills_url }
			end
		end
	end
	
	def destroy
		@bill.destroy

		respond_to do |format|
			format.html { redirect_to bills_url }
		end
	end

	private
		def bills_params
			params.require(:bill).permit(:name, :value, :category_id, :image)
		end

		def set_bill
			@bill = Bill.find(params[:id])
		end
end
