require 'spec_helper'

describe Api::V1::ActionSubjectsController do

  describe "GET #index" do
    before(:each) do
      @subject1 = FactoryGirl.create :action_subject
      @subject2 = FactoryGirl.create :action_subject

      get :index
    end

    it "renders action subjects list as json" do
      subjects_response = json_response[:action_subjects]

      expect(subjects_response.count).to eql 2

      expect(subjects_response[0][:id]).to eql @subject1[:id]
      expect(subjects_response[1][:id]).to eql @subject2[:id]
    end

    it { should respond_with 200}
  end
end
