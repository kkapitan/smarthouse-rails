require 'spec_helper'

describe Action do
  before { @action = FactoryGirl.build(:action) }

  subject { @action }

  it { should belong_to :user }
  it { should belong_to :action_subject }

  it { should respond_to :action_type}
  it { should validate_presence_of :action_type }
  it { should validate_presence_of :user }
  it { should validate_presence_of :action_subject }

end
