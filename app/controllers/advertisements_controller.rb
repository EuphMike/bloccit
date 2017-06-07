class AdvertisementsController < ApplicationController

  def index
    @adverts = Advertisement.all
  end

  def show
    @advert = Advertisement.find(params[:id])
  end

  def new
    @advert = Advertisement.new
  end

  def create
    @advert = Advertisement.new
    @advert.title = params[:advert][:title]
    @advert.copy = params[:advert][:copy]
    @advert.price = params[:advert][:price]

    if @advert.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advert
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end
end