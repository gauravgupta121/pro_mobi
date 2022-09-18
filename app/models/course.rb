class Course < ApplicationRecord
  has_many :tutors

  validates :name, :duration, presence: true

  accepts_nested_attributes_for :tutors
end
