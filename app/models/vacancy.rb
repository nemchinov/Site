class Vacancy < ActiveRecord::Base
  attr_accessible :title, :salary, :duration, :information
end
