require 'rails_helper'

describe Api::V1::StudentsController, type: :controller do
  let!(:resource) { create :student }
  let(:params) { { name: 'Pepe', surname: 'Perez', birthdate: '2019-08-08',
                   phone: '1', address: 'Street 123', email: 'test@test.com' } }

  describe '#INDEX' do
    it 'contains resource' do
      get :index
      expect(assigns(:students)).to eq([resource])
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:student)).to eq(resource)
    end
  end

  describe '#SHOW' do
    it 'returns resource' do
      get 'show', params: { id: resource.id }
      expect(assigns(:student)).to eq(resource)
    end
  end

  describe '#POST' do
    it 'creates student' do
      post 'create', params: params
      expect(response.status).to eq(200)
    end
  end

  describe '#DESTROY' do
    it 'deletes student' do
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

  describe '#start_course' do
    let!(:course) { create :course }
    let!(:course_student) { create :course_student, course_id: course.id, student_id: resource.id }

    it 'updates resource' do
      put 'start_course', params: { id: resource.id, course_id: course.id }

      expect(response.status).to eq(200)
    end
  end

  describe '#finish_course' do
    let(:course) { create :course }
    let(:challenge) { create :challenge, course: course }
    let!(:resource) { create :student }
    let!(:student_challenge) { create :student_challenge, challenge_id: challenge.id, student_id: resource.id, score: 5 }
    let!(:course_student) { create :course_student, course_id: course.id, student_id: resource.id, aasm_state: 'in_progress' }

    it 'updates resource' do
      put 'finish_course', params: { id: resource.id, course_id: course.id }
      expect(response.status).to eq(200)
    end
  end
end
