class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :action_subject

  belongs_to :action_trigger

  validates :user, presence: true
  validates :action_subject, presence: true

  validates :action_type, presence: true

  enum action_type: [:switch, :timer, :beacon]

  enum state: [:off, :on, :toggled]

end
