class Event < ActiveRecord::Base
  belongs_to :actor
  belongs_to :repo

  validates :id, uniqueness: true
end
