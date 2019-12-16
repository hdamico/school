require 'rails_helper'

describe Api::V1::TeachersController, type: :controller do
  let!(:resource) { create :teacher }
  let(:params) { { name: 'Pepe', surname: 'Perez', birthdate: '2019-08-08',
                   phone: '1', address: 'Street 123', email: 'test@test.com' } }

  describe '#INDEX' do
    it 'contains resource' do
      get :index
      expect(assigns(:teachers)).to eq([resource])
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:teacher)).to eq(resource)
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:teacher)).to eq(resource)
    end
  end

  describe '#POST' do
    it 'creates teacher' do
      post 'create', params: params
      expect(response.status).to eq(200)
    end
  end

  describe '#DESTROY' do
    it 'deletes teacher' do
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

  describe '#enroll_course' do
    let(:course) { create :course }

    it 'updates resource' do
      put 'enroll_course', params: { id: resource.id, course_id: course.id }
      expect(resource.courses.count).to be(1)
    end
  end
end
