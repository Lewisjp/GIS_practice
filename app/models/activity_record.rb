class ActivityRecord < ActiveRecord::Base
  attr_accessible :coords

  GEOFACTORY = RGEO::Geographic.simple_mercator_factory
  set_rgeo_factory_for_column(:coords, GEOFACTORY.projection_factory)

  def self.in_rect(w,s,e,n)
    sw = GEOFACTORY.point(w,s).projection
    ne = GEOFACTORY.point(e,n).projection 
    box = RGeo::Cartesian::BoundingBox.create_from_points(sw,ne)
    where(["coords && ?", box])
  end

end
