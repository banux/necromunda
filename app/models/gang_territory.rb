class GangTerritory
  include DataMapper::Resource
  
  property :id, Serial

  property :territory_id, Integer
  property :gang_id, Integer

end
