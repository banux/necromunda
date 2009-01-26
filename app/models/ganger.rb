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

  has 1, :ganger_gangs
  has 1, :gangs, :through => :ganger_gangs
end
