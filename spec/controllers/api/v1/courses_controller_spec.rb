require 'rails_helper'

describe Api::V1::CoursesController, type: :controller do
  let!(:resource) { create :course }
  let(:params) { { name: 'Math', time_load: 40, price: 2000 } }

  describe '#INDEX' do
    it 'contains resource' do
      get :index
      expect(assigns(:courses)).to eq([resource])
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:course)).to eq(resource)
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:course)).to eq(resource)
    end
  end

  describe '#POST' do
    it 'creates course' do
      post 'create', params: params
      expect(response.status).to eq(200)
    end
  end

  describe '#DESTROY' do
    it 'deletes course' do
      delete 'destroy', params: { id: resource.id }
      expect(response.status).to eq(200)
    end
  end

  describe '#UPDATE' do
    let(:name) { 'Jose' }
    it 'updates resource' do
      put 'update', params: { id: resource.id, name: name }
      expect(JSON.parse(response.body)['name']).to eq(name)
    end
  end
end