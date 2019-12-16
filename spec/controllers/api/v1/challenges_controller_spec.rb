require 'rails_helper'

describe Api::V1::ChallengesController, type: :controller do
  let!(:course) { create :course }
  let!(:resource) { create :challenge, course: course }
  let(:params) { { name: 'Final', content: { first_quarter: '1984', second_quarter: 'Titanic' }.to_json, course_id: course.id } }

  describe '#INDEX' do
    it 'contains resource' do
      get :index
      expect(assigns(:challenges)).to eq([resource])
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:challenge)).to eq(resource)
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:challenge)).to eq(resource)
    end
  end

  describe '#POST' do
    it 'creates challenge' do
      post 'create', params: params
      expect(response.status).to eq(200)
    end
  end

  describe '#DESTROY' do
    it 'deletes challenge' do
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
