require "rexml/document"
require REXML

class HelloController < ApplicationController
  def index
    @xml = ""
    doc = REXML::Document.new(params["xml"])
    root = doc.elements.each( "*/country/field" ) { |element|
      xml += element
    }
    root = doc.add_element( "country" )
    field = root.add_element( "field" )
    field.add_attribute( "zero_x", "0")
    field.add_attribute( "zero_y", "0")
    field.add_attribute( "zero_x", "60")
    field.add_attribute( "zero_y", "60")
    #@xml = [ \
    #  "2777" => ["name" => "clower", "x" => 0, "y" => 0, "process_end" => 3550000], \
    #  "2778" => ["name" => "sunflower", "x" => 0, "y" => 0, "process_end" => 3550000] \
    #]
    root.write( @xml, 1 )
    # params['test'];
    render :xml => @xml
  end
end
