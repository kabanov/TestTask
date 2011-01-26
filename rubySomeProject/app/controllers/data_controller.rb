require "rexml/document"
include REXML

class DataController < ApplicationController
  def all
    @xml = ""
    doc = REXML::Document.new()
    # root = doc.elements.each( "*/country/field" ) { |element|
    #   xml += element
    # }
    @figuresName = ['clover', 'potato', 'sunflower']
    root = doc.add_element( "country" )
    field = root.add_element( "field" )
    field.add_attribute( "zero_x", "0")
    field.add_attribute( "zero_y", "0")
    field.add_attribute( "zero_x", "60")
    field.add_attribute( "zero_y", "60")
    @figures = Figures.all()
    #@figures = [ \
    #  {"id" => "2777", "name" => "clover", "x" => 0, "y" => 0, "process_end" => 3550000 }, \
    #  {"id" => "2778", "name" => "sunflower", "x" => 0, "y" => 5, "process_end" => 3550000} \
    #]
    @figures.each { |el|
      name = field.add_element( @figuresName[el.f_type] )
      name.add_attribute( "id", el.id )
      name.add_attribute( "x", el.x )
      name.add_attribute( "y", el.y )
      name.add_attribute( "age", el.age )
    }
    doc.write( @xml, 1 )
    # params['test']
    render :xml => @xml
  end
  
  def save
    @xml = ""
    doc = REXML::Document.new()
    
    if(params['type'] == "add")
      figures = Figures.create(
            :x => params['x'],
            :y => params['y'],
            :age => 0,
            :f_type => params['f_type']
          )
      id = figures.id.to_s
      data = "Create new element '" + params['figure'] + "', id = " + id + ": (" + params['x'] + ", " + params['y'] + ")\n"
      File.open('log.txt', 'a'){ |file| file.write data }
      root = doc.add_element( "element" )
      root.add_attribute( "id", id)
      root.add_attribute( "num", params['num'])
      doc.write( @xml, 1 )
      render :xml => @xml
    end
    
    if(params['type'] == "grow")
      figures = Figures.find(:first, :conditions => ["id = ?", params['id']])
      figures.age = params['age'];
      figures.save;
      data = "Grow element '" + params['figure'] + "', id = " + params['id'] + ", age: (" + params['age'] + ")\n"
      File.open('log.txt', 'a'){ |file| file.write data }
      doc.write( @xml, 1 )
      render :xml => @xml
    end
    
    if(params['type'] == "rem")
      #figures = Figures.find(:first, :conditions => ["id = ?", params['id']])
      Figures.delete(params['id']);
      data = "Remove element '" + params['figure'] + "', id  = " + params['id'] + "\n"
      File.open('log.txt', 'a'){ |file| file.write data }
      doc.write( @xml, 1 )
      render :xml => @xml
    end
    
  end
  
  def test
    figures = Figures.all()
    render :xml => "<as id = " + figures.to_s + "/>"
  end

end
