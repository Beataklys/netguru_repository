require 'rails_helper'

RSpec.describe Teacher do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :academic_title }
    it { is_expected.to validate_inclusion_of(:academic_title).in_array(Teacher::TITLES) }
  end

  describe 'database columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
    it { should have_db_column :academic_title }
  end

  describe 'associations' do
    it { is_expected.to have_many :subject_items }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for :subject_items }
  end
end
