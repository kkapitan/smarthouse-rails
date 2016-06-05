require 'spec_helper'

describe Beacon do
  before { @beacon = FactoryGirl.build(:beacon) }

  subject { @beacon }

  it { should respond_to(:name) }
  it { should respond_to(:major) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:major) }

  it { should validate_uniqueness_of(:major) }
  it { should validate_uniqueness_of(:name) }
end