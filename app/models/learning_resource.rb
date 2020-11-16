class LearningResource < ApplicationRecord
  belongs_to :language
  validates_length_of :reference, minimum: 5
end
