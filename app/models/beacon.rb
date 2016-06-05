class Beacon < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :major, presence: true, uniqueness: true

end
