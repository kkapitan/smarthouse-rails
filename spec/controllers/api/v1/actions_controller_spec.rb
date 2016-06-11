require 'spec_helper'

describe Api::V1::ActionsController do
  before(:each) do
    @user = FactoryGirl.create :user
    api_authorization_header(@user[:auth_token])
  end

  describe "GET #index" do
    before(:each) do

      @user2 = FactoryGirl.create :user

      @beacon1 = FactoryGirl.create :beacon, name: "b1"
      @beacon2 = FactoryGirl.create :beacon, name: "b2"

      @action1 = FactoryGirl.create :action, user: @user
      @action2 = FactoryGirl.create :action, user: @user
      @action3 = FactoryGirl.create :action, user: @user,  action_type: "timer"
      @action4 = FactoryGirl.create :action, user: @user2

      get :index
    end


    it "responds with json containing list of beacons" do
      beacons_response = json_response[:beacons]

      expect(beacons_response.count).to eql 2
    end

    it "responds with json containing list of actions for current user divided by section" do
      sections_response = json_response[:sections]

      switch_actions_response = sections_response[0][:actions]

      expect(switch_actions_response.count).to eql 2
      expect(switch_actions_response[0][:id]).to eql @action1.id
      expect(switch_actions_response[1][:id]).to eql @action2.id

      timer_actions_response = sections_response[1][:actions]

      expect(timer_actions_response.count).to eql 1
      expect(timer_actions_response[0][:id]).to eql @action3.id

      beacon_actions_response =sections_response[2][:actions]

      expect(beacon_actions_response.count).to eql 0
    end

    it "responds with json containing sections as action_types" do
      sections_response = json_response[:sections]
      expect(sections_response.count).to eql Action.action_types.count
      expect(sections_response[0][:action_type][:id]).to eql 0
    end

    it { should respond_with 200 }
  end

  describe "GET #create" do

    context "When creating results in success" do
      before(:each) do
        @action = FactoryGirl.create :action

        @trigger_attributes = FactoryGirl.attributes_for :action_trigger
        @trigger_attributes[:trigger_type] = 2

        @action_attributes = { action_subject_id: @action.action_subject_id, trigger: @trigger_attributes }
        post :create, @action_attributes
      end

      it "renders json with information about action trigger" do
        trigger_response = json_response[:action][:trigger]
        expect(trigger_response[:type]).to eql @trigger_attributes[:trigger_type]
      end

      it "renders json with information about created action" do
        action_response = json_response[:action]
        expect(action_response[:action_subject][:id]).to eql @action_attributes[:action_subject_id]
      end

      it { should respond_with 201 }
    end

    context "When creating results in errors" do
      before(:each) do
        @action_attributes = { action_subject_id: 11000 }

        @trigger_attributes = FactoryGirl.attributes_for :action_trigger
        @trigger_attributes[:trigger_type] = 2

        @action_attributes = { action_subject_id: 11000, trigger: @trigger_attributes }
        post :create, @action_attributes
      end

      it "renders json with errors" do
        expect(json_response[:errors]).not_to eql nil
      end

      it { should respond_with 422 }
    end

  end

  describe "DELETE #action" do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header(@user.auth_token)

      @action = FactoryGirl.create :action, user: @user
      delete :destroy, id: @action.id
    end

    it { should respond_with 204 }
  end



end
