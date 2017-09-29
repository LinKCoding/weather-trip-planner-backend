class UserTripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :locations

  def locations
    if object.locations
      all_locations = object.locations.map do |e|
       e.name
      end
      all_locations.join(" -- ")
    end
  end
end
