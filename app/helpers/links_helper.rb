module LinksHelper

  def expire_time(minutes)
    if minutes < 60
      "#{minutes} minutes"
    else
      "#{minutes / 60} hours"
    end
  end
end
