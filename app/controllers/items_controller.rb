class ItemsController < ApplicationController

	def index
		@items = Item.all
		 render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>") 
	end

	def create
        @item = Item.create(item_params)
        params
        render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?}), #{@item.description}"
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :description, :price, :real)
    end
end
