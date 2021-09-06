require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
  end 
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(15).is_at_most(150) }
  end 
  
  describe 'aasm states for priority' do
    task = Task.new
    it { expect(task).to have_state(:lowing).on(:priority) }
    it { expect(task).to transition_from(:lowing).to(:highing).on_event(:high).on(:priority) }
    it { expect(task).not_to transition_from(:highing).to(:lowing).on_event(:high).on(:priority) }
    it { expect(task).to have_state(:highing).on(:priority) }
    it { expect(task).not_to have_state(:lowing).on(:priority) }
    it { expect(task).to allow_event(:low).on(:priority) }
    it { expect(task).to transition_from(:highing).to(:lowing).on_event(:low).on(:priority) }
    it { expect(task).not_to have_state(:highing).on(:priority) }
    it { expect(task).to allow_event(:high).on(:priority) }
    it { expect(task).not_to allow_event(:low).on(:priority) }
  end
  
  describe 'aasm states for progress' do
    task = Task.new
    it { expect(task).to have_state(:initialized).on(:progress) }
    it { expect(task).to transition_from(:initialized).to(:finalized).on_event(:done).on(:progress) }
    it { expect(task).not_to have_state(:initialized).on(:progress) }
    it { expect(task).to have_state(:finalized).on(:progress) }
    it { expect(task).not_to allow_event(:done).on(:progress) }
    
  end 
end
