class GangerGang
  include DataMapper::Resource
  
  property :id, Serial

  property :ganger_id, Integer
  property :gang_id, Integer

end
