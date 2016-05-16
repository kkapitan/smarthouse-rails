require 'spec_helper'

describe Api::V1::UsersController do

  before(:each) { request.headers['Accept'] = "application/vnd.smarthouse.v1"}

  describe "GET #show" do
    before(:each) do
      @user = FactoryGirl.create :user
      get :show, id: @user.id, format: :json
    end

    it "returns the information about a reporter on hash" do
      user_response = json_response
      expect(user_response[:email]).to eql @user.email
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "When request results in success" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, user: @user_attributes, format: :json
      end

      it "returns the information about created object" do
        user_response = json_response
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "When request results in error" do

      before(:each) do
        @invalid_user_attributes = FactoryGirl.attributes_for :user
        @invalid_user_attributes[:email] = "invalid.email"

        post :create, user: @invalid_user_attributes, format: :json
      end

      it "returns information about errors" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it { should respond_with 422 }
    end



  end

end
