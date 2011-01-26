require 'active_record'

class Figures < ActiveRecord::Base
  validates_presence_of :x, :y, :age, :f_type
end