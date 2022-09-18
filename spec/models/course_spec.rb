require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:tutors) }
    it { is_expected.to accept_nested_attributes_for(:tutors) }
  end

  describe 'Validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:duration) }
  end
end 