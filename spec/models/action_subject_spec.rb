require 'spec_helper'

describe ActionSubject do

  before { @subject = FactoryGirl.build(:action_subject) }

  subject { @subject }

  it { should respond_to :name }

  it { should validate_presence_of(:name) }

end
