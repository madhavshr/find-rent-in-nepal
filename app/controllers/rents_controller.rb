class RentsController < ApplicationController
  before_action :find_book, only:[:show, :edit,:update, :destroy]
  def index
    if params[:category].blank?
    @rent = Rent.all.order("created_at DESC")
  else
    @category_id = Category.find_by(name: params[:category]).id
    @rents = Rent.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def new
    @rent = current_user.rents.build
    @categories = Category.all.map{|c|[c.name,c.id]}
  end

  def create
     @rent = current_user.rents.build(rent_params)
     @rent.category_id = params[:category_id]
     if @rent.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
      @categories = Category.all.map{|c|[c.name,c.id]}
  end

  def show
  end

  def update
    @rent.category_id = params[:category_id]
    if @rent.update(rent_params)
      redirect_to rent_path(@rent)
    else
      render 'edit'
    end
  end

  def destroy
    @rent.destroy
    redirect_to root_path
  end
  private
  def rent_params
    params.require(:rent).permit(:location, :ownername, :contact, :price, :description,:category_id)  
  end
   def find_book
      @rent = Rent.find(params[:id])
    end
end
