require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do

  let (:my_advert) {Advertisement.create(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1.9999))}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advert] to @adverts" do
      get :index
      expect(assigns(:adverts)).to eq([my_advert])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advert" do
      get :new
      expect(assigns(:advert)).not_to be_nil
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_advert.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_advert.id}
      expect(response).to render_template :show
    end

    it "assigns my_advert to @advert" do
      get :show, {id: my_advert.id}
      expect(assigns(:advert)).to eq(my_advert)
    end
  end

  describe "POST create" do

    it "increase the number of Advertisements by 1" do
      expect{post :create, advert: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: rand(1.9999)}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the new advertisement to @advert" do
      post :create, advert: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 77}
    end

    it "redirects to the new advertisement" do
      post :create, advert: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 66}
      expect(response).to redirect_to Advertisement.last
    end
  end
end