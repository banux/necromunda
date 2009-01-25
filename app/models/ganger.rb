class Ganger
  include DataMapper::Resource
  
  property :id, Serial

  property :cc, Integer
  property :name, String
  property :cd, Integer
  property :a, Integer
  property :m, Integer
  property :xp, Integer
  property :cost, Integer
  property :e, Integer
  property :pv, Integer
  property :f, Integer
  property :ct, Integer
  property :equipment, Text
  property :i, Integer

end
