require 'spec_helper'

describe ActionTrigger do
  before { @trigger = FactoryGirl.build(:action_trigger) }

  subject { @trigger }

  it { should respond_to(:trigger_type) }

  it { should respond_to(:start_hour) }
  it { should respond_to(:finish_hour) }
  it { should respond_to(:day_hour) }

  it { should respond_to(:hours) }
  it { should respond_to(:weeks) }
  it { should respond_to(:minutes) }
  it { should respond_to(:week_days) }

  it { should respond_to(:beacon) }

  context "When trigger type is weekly timer" do
    before(:each) { allow(subject).to receive(:weekly_timer?).and_return(true) }

    it {should validate_presence_of(:week_days)}
    it {should validate_presence_of(:day_hour)}
    it {should validate_presence_of(:weeks)}

  end

  context "When trigger type is beacon" do
    before(:each) { allow(subject).to receive(:beacon?).and_return(true) }

    it {should validate_presence_of(:beacon)}

  end

  context "When trigger type is daily timer" do
    before(:each) { allow(subject).to receive(:daily_timer?).and_return(true) }

    it {should validate_presence_of(:week_days)}
    it {should validate_presence_of(:hours)}
    it {should validate_presence_of(:minutes)}
    it {should validate_presence_of(:start_hour)}
    it {should validate_presence_of(:finish_hour)}

  end

  context "When trigger type is switch timer" do
    before(:each) { allow(subject).to receive(:switch?).and_return(true) }

  end

end
