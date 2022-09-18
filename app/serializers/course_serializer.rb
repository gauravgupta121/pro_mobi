class CourseSerializer
  include FastJsonapi::ObjectSerializer

  has_many :tutors

  attributes :name,
             :description,
             :duration
end
