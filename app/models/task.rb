class Task < ApplicationRecord
  include AASM
  
  belongs_to :project
  
  
  aasm column: :prioritize do
    state :lowing, initial: true
    state :highing

    event :high do
      transitions from: :lowing, to: :highing
    end

    event :low do
      transitions from: :highing, to: :lowing
    end
  end
  
end
