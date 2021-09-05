require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
  end 
  
  describe 'aasm states' do
    task = Task.new
    it { expect(task).to have_state(:lowing) }
    it { expect(task).to transition_from(:lowing).to(:highing).on_event(:high) }
    it { expect(task).not_to transition_from(:highing).to(:lowing).on_event(:high) }
    it { expect(task).not_to have_state(:lowing) }
    it { expect(task).to allow_event(:low) }
    it { expect(task).to transition_from(:highing).to(:lowing).on_event(:low) }
    it { expect(task).not_to have_state(:highing) }
    it { expect(task).to allow_event(:high) }
    it { expect(task).not_to allow_event(:low) }
  end
end
