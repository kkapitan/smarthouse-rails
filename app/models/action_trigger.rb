class ActionTrigger < ActiveRecord::Base
  enum trigger_type: [:switch, :daily_timer, :weekly_timer, :beacon]

  serialize :week_days

  with_options if: :daily_timer? do |daily_timer|
    daily_timer.validates :week_days, presence: true
    daily_timer.validates :hours, presence: true
    daily_timer.validates :minutes, presence: true
    daily_timer.validates :start_hour, presence: true
    daily_timer.validates :finish_hour, presence: true
  end

  with_options if: :weekly_timer? do |weekly_timer|
    weekly_timer.validates :week_days, presence: true
    weekly_timer.validates :weeks, presence: true
    weekly_timer.validates :day_hour, presence: true
  end

  with_options if: :switch? do |switch|
  end

  with_options if: :beacon? do |beacon|
    beacon.validates :beacon, presence: true
  end

  belongs_to :beacon

  def is_timer_type?
    return trigger_type == :daily_timer || trigger_type == :weekly_timer
  end

end
