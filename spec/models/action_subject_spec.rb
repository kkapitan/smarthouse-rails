require 'spec_helper'

describe ActionSubject do

  before { @subject = FactoryGirl.build(:action_subject) }

  subject { @subject }

  it { should respond_to :name }
  it { should respond_to :state }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:state) }

end
