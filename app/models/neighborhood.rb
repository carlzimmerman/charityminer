class Neighborhood < ActiveRecord::Base
  has_many :pins
  attr_accessor :name
end
