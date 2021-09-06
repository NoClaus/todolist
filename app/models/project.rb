class Project < ApplicationRecord
  
  has_many :tasks
  
  validates :title, presence: true
  validates :title, length: { minimum: 15, maximum: 150 }
end
