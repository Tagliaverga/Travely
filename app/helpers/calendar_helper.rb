module CalendarHelper
  def color_for(trip)
    Digest::MD5.hexdigest(trip.id.to_s)[0..5]
  end
end
