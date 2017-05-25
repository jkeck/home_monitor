class HomeMonitor
  def self.for(type)
    case type.to_s
    when 'garden'
      GardenMonitor
    else
      DefaultMonitor
    end
  end
end
