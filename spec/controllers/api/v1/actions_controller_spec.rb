require 'spec_helper'

describe Api::V1::ActionsController do
  before(:each) do
    @user = FactoryGirl.create :user
    api_authorization_header(@user[:auth_token])
  end

  describe "GET #index" do
    before(:each) do

      @user2 = FactoryGirl.create :user

      @action1 = FactoryGirl.create :action, user: @user
      @action2 = FactoryGirl.create :action, user: @user
      @action3 = FactoryGirl.create :action, user: @user2

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

  describe "GET #create" do

    context "When creating results in success" do
      before(:each) do
        @action = FactoryGirl.create :action
        @action_attributes = { action_subject_id: @action.action_subject_id }

        post :create, @action_attributes
      end

      it "renders json with information about created action" do
        action_response = json_response[:action]
        expect(action_response[:action_subject][:id]).to eql @action_attributes[:action_subject_id]
      end

      it { should respond_with 201 }
    end

    context "When creating results in errors" do
      before(:each) do
        @action_attributes = { action_subject_id: 11000}

        post :create, @action_attributes
      end

      it "renders json with errors" do
        expect(json_response[:errors]).not_to eql nil
      end

      it { should respond_with 422 }
    end

  end


end
