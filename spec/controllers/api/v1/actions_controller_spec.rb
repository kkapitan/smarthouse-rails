require 'spec_helper'

describe Api::V1::ActionsController do
  describe "GET #index" do
    before(:each) do
      @user1 = FactoryGirl.create :user
      @user2 = FactoryGirl.create :user

      @action1 = FactoryGirl.create :action, user: @user1
      @action2 = FactoryGirl.create :action, user: @user1
      @action3 = FactoryGirl.create :action, user: @user2

      api_authorization_header(@user1[:auth_token])
      get :index
    end


    it "responds with json containing list of actions for current user" do
      actions_response = json_response[:actions]

      expect(actions_response.count).to eql 2
      expect(actions_response[0][:id]).to eql @action1.id
      expect(actions_response[1][:id]).to eql @action2.id
    end

    it { should respond_with 200 }
  end
end
