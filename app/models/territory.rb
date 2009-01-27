class Territory
  include DataMapper::Resource
  
  property :id, Serial

  property :name, String
  property :income, String
  property :description, Text

end
