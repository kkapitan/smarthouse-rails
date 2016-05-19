class ActionSubject < ActiveRecord::Base

  validates :name, presence: true
end
