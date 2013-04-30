class Treasure < ActiveRecord::Base
  attr_accessible :description, :found, :hider, :keyword, :lat, :long, :name, :seeker
end
