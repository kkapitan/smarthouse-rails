class ActionSubject < ActiveRecord::Base
  has_many :actions

  validates :name, presence: true
end
