class UserTripSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :locations, :user_name

  def locations
    if object.locations.size != 0
      all_locations = object.locations.map do |e|
       "#{e.name}||#{e.start_date}||#{e.end_date}"
      end
      all_locations.join(" -- ")
    end
  end

  def user_name
    "#{object.user.name}"
  end

end
