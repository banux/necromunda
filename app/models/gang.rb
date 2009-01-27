class Gang
  include DataMapper::Resource
  
  property :id, Serial

  property :name, String
  property :cost, Integer
  property :xp, Integer
  property :magot, Text
  property :house, String

  has n, :ganger_gangs
  has n, :gang_territories
  has n, :gangers, :through => :ganger_gangs
  has n, :territories, :through => :gang_territories
end
