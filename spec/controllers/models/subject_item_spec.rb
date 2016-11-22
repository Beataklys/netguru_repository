require 'rails_helper'

RSpec.describe SubjectItem do
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
  end

  describe 'database columns' do
    it { should have_db_column :title }
    it { should have_db_column :teacher_id }
  end

  describe 'associations' do
    it { is_expected.to have_many :participations }
    it { is_expected.to have_many :students }
    it { is_expected.to have_many :subject_item_notes }
    it { is_expected.to belong_to :teacher }
  end
end
