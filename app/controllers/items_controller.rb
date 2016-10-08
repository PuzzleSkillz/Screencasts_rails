class ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  # /items/1 GET
  def show
  	unless @item = Item.where(id: params[:id]).first
  		render text: "Page not found", status: 404
  	end
  end

  # /items/new GET
  def new

  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
  	# @item = Item.create(item_params)
  	# render text: "#{@item.id}: #{@item.name} (#{!@item.new_record?})"
  	@item = Item.create(item_params)
  	if @item.errors.empty?
  		redirect_to item_path(@item)
  	else
  		render "new"
  	end
  end

  # /items/1 PUT
  def update
  	# @item.update_attributes(item_params)
  	# if @items.errors.empty?
  	# 	redirect_to crop_image_item_path(@item)
  	# else
  	# 	render "edit"
  	# end
  end

  # /items/1 DELETE
  def destroy
  end

	private
	
	  def item_params
	   params.require(:item).permit(:name, :description, :price, :real, :weight)		
	  end

end