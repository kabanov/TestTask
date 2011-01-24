require "rexml/document"
include REXML

class DataController < ApplicationController
  def all
    @xml = ""
    doc = REXML::Document.new()
    # root = doc.elements.each( "*/country/field" ) { |element|
    #   xml += element
    # } 
    root = doc.add_element( "country" )
    field = root.add_element( "field" )
    field.add_attribute( "zero_x", "0")
    field.add_attribute( "zero_y", "0")
    field.add_attribute( "zero_x", "60")
    field.add_attribute( "zero_y", "60")
    @figures = [ \
      {"id" => "2777", "name" => "clover", "x" => 0, "y" => 0, "process_end" => 3550000 }, \
      {"id" => "2778", "name" => "sunflower", "x" => 0, "y" => 5, "process_end" => 3550000} \
    ]
    @figures.each { |el|
      name = field.add_element( el["name"] )
      name.add_attribute( "id", el["id"] )
      name.add_attribute( "x", el["x"] )
      name.add_attribute( "y", el["y"] )
      name.add_attribute( "process_end", el["process_end"] )
    }  
    doc.write( @xml, 1 )    
    # params['test'];
    render :xml => @xml
  end

end
