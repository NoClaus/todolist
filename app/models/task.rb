class Task < ApplicationRecord
  include AASM
  
  belongs_to :project
  

  validates :title, presence: true
  validates :title, length: { minimum: 15, maximum: 150 }
  
  
  aasm :priority, column: 'prioritize' do
    state :lowing, initial: true
    state :highing

    event :high do
      transitions from: :lowing, to: :highing
    end

    event :low do
      transitions from: :highing, to: :lowing
    end
  end
  

  aasm :progress, column: 'progress' do
    state :initialized, initial: true
    state :finalized
    
    event :done do
      transitions from: :initialized, to: :finalized
    end
    
  end
end
