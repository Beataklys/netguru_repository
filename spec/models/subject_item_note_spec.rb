require 'rails_helper'

RSpec.describe SubjectItemNote do
  describe 'validations' do
    it { is_expected.to validate_presence_of :student_id }
    it { is_expected.to validate_presence_of :subject_item_id }
  end

  describe 'database columns' do
    it { should have_db_column :student_id }
    it { should have_db_column :subject_item_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :student }
    it { is_expected.to belong_to :subject_item }
  end
end
