require 'spec_helper'

describe Action do
  before { @action = FactoryGirl.build(:action) }

  subject { @action }

  it { should belong_to :user }
  it { should belong_to :action_subject }


end
