require 'active_record'

class Figures < ActiveRecord::Base
  validates_presence_of :id, :x, :y, :age, :f_type
end