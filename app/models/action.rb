class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :action_subject

  validates :user, presence: true
  validates :action_subject, presence: true
end
