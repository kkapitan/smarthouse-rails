class ActionSubject < ActiveRecord::Base
  has_many :actions

  validates :name, presence: true
  validates :state, presence: true

  enum state: [:off, :on]
end
