class Gang
  include DataMapper::Resource
  
  property :id, Serial

  property :name, String
  property :cost, Integer
  property :xp, Integer
  property :magot, Text
  property :house, String

end
