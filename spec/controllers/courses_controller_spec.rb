require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:create_course_params) {
    { 
      "course" => {
        "name" => "Course 1",
        "duration" => 1,
        "description" => "Basic Course",
        "tutors_attributes" => [
          {
            "first_name" => "FirstName1",
            "last_name" => "LastName1",
            "gender" => 'male',
            "email" => "email123@example.com"
          },
          {
            "first_name" => "FirstName2",
            "last_name" => "LastName1",
            "gender" => 'female',
            "email" => "email@example.com"
          }
        ]
      }
    }
  }

  describe 'Index' do
    it 'when records are present it should return the data' do
      get :index, params: {page: 1, per: 1}, format: :json
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['data']).to be_blank
    end

    it 'when records are not present it should return the blank response' do
      post :create, params: create_course_params, format: :json

      get :index, params: {page: 1, per: 1}, format: :json
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['data']).to be_present
    end
  end

  describe 'Create' do
    it 'when passed attribues are valid should store the data' do
      post :create, params: create_course_params, format: :json
      expect(response.status).to eq(200)
    end

    it 'when passed attribues are invalid should not store the data' do
      create_course_params['course']['name'] = nil
      post :create, params: create_course_params, format: :json
      expect(response.status).to eq(422)
    end
  end
end