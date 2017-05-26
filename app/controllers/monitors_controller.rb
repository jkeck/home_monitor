class MonitorsController < ApplicationController
  # GET /monitors
  # GET /monitors.json
  def index
    @monitors = home_monitor.line_chart_json.first # first until we have multiple containers
  end

  # POST /monitors
  # POST /monitors.json
  # curl --request POST 'http://localhost:3000/monitors' --data 'type=garden&monitor[name]=plbox1&monitor[temp]=75&monitor[moisture]=20&monitor[light]=45'
  def create
    @monitor = home_monitor.new(monitor_params)

    respond_to do |format|
      if @monitor.save
        format.json { render json: @monitor, status: :created }
      else
        format.json { render json: @monitor.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def home_monitor
    HomeMonitor.for(monitor_type)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def monitor_params
    params.fetch(:monitor, {}).permit(:moisture, :name, :temp)
  end

  def monitor_type
    params.fetch(:type, nil)
  end
end
