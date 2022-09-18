class CoursesController < ApplicationController

  def index
    courses = Course.all
    q = Course.includes(:tutors).ransack(params[:q])
    courses = q.result.page(params[:page]).per(params[:per])
    render json: CourseSerializer.new(courses, include: %i(tutors)).serialized_json, status: 200
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: CourseSerializer.new(course, include: %i(tutors)).serialized_json, status: 200
    else
      render json: ErrorMessageSerializer.new('VAL-ERROR-001', request.path, course.errors.full_messages), status: 422
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      :duration,
      tutors_attributes: %i(
        id
        course_id
        first_name
        last_name
        gender
        email
      )
    )
  end
end