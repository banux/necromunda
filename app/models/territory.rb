class Territory
  include DataMapper::Resource
  
  property :id, Serial

  property :name, String
  property :cost, Integer
  property :description, Text

end
