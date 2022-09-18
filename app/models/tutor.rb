class Tutor < ApplicationRecord
  # enum gender: { male: 1, female: 2, other: 3 }
  enum gender: [:male, :female, :other]

  belongs_to :course

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
