class Task < ApplicationRecord
  include AASM
  
  belongs_to :project
  
<<<<<<< HEAD
  validates :title, presence: true
  validates :title, length: { minimum: 15, maximum: 150 }
  
  
  aasm :priority, column: 'prioritize' do
=======
  
  aasm column: :prioritize do
>>>>>>> add3089ef244268348233c098b53d3cbdb342f38
    state :lowing, initial: true
    state :highing

    event :high do
      transitions from: :lowing, to: :highing
    end

    event :low do
      transitions from: :highing, to: :lowing
    end
  end
  
<<<<<<< HEAD
  aasm :progress, column: 'progress' do
    state :initialized, initial: true
    state :finalized
    
    event :done do
      transitions from: :initialized, to: :finalized
    end
    
  end
  
=======
>>>>>>> add3089ef244268348233c098b53d3cbdb342f38
end
