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
    @advert.title = params[:advertisement][:title]
    @advert.copy = params[:advertisement][:copy]
    @advert.price = params[:advertisement][:price]

    if @advert.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advert
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end
end