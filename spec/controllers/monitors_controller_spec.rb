require 'rails_helper'

RSpec.describe MonitorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Monitor. As you add validations to Monitor, be sure to
  # adjust the attributes here as well.
  let(:garden_monitor_attributes) do
    {
      monitor: {
        name: 'pbox1',
        temp: 70, moisture: 20, light: 40
      }
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MonitorsController. Be sure to keep this updated too.

  describe 'GET #index' do
    it 'returns a success response' do
      GardenMonitor.create! garden_monitor_attributes[:monitor]
      get :index, params: { type: 'garden' }
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid garden monitor params' do
      it 'creates a new GardenMonitor' do
        expect do
          post :create, params: { type: 'garden', monitor: garden_monitor_attributes }, format: :json
        end.to change(GardenMonitor, :count).by(1)
      end

      it 'renders the GardenMonitor as json' do
        post :create, params: { type: 'garden', monitor: garden_monitor_attributes }, format: :json
        body = JSON.parse(response.body)

        expect(body['id']).to eq GardenMonitor.last.id
      end
    end
  end
end
