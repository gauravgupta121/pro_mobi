require 'spec_helper'

RSpec.describe Tutor, type: :model do

  describe 'Enum' do
    it { is_expected.to define_enum_for(:gender).with_values [:male, :female, :other] }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:course) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end