class GardenMonitor < ApplicationRecord
  scope :recent, (->(days = 5) { where('created_at >= ?', Time.zone.now - days.days) })
  scope :containers, (-> { recent.pluck(:name).uniq })

  class << self
    def line_chart_json
      containers.map do |container|
        monitors = recent.where(name: container)
        %w[Temp Moisture Light].map do |type|
          line_chart_config_for(type, monitors)
        end
      end
    end

    private

    def line_chart_config_for(type, monitors)
      {
        name: type,
        data: monitors.each_with_object({}) do |monitor, hash|
          hash[monitor.created_at] = monitor.send(type.downcase.to_sym)
        end
      }
    end
  end
end
