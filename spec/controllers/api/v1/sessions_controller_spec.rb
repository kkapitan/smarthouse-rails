require 'spec_helper'

describe Api::V1::SessionsController do
  describe "#POST create" do
    before(:each) do
      @user = FactoryGirl.create :user
    end

    context "When succesfully login" do
      before(:each) do
        credentials = { email: @user.email, password: "12345678" }
        post :create, { session: credentials}
      end

      it "returns the user record corresponding to the given credentials" do
        @user.reload
        expect(json_response[:auth_token]).to eql @user.auth_token
      end

      it { should respond_with 201 }
    end

    context "When login results in failure" do
      before(:each) do
        credentials = { email: @user.email, password: "wrongpassword" }
        post :create, { session: credentials}
        print json_response
      end

      it "renders errors json" do
        expect(json_response).to have_key(:errors)
      end

      it { should respond_with 422 }
    end
  end
end