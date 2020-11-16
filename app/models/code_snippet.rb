class CodeSnippet < ApplicationRecord
  belongs_to :language
  validates_length_of :code, minimum: 5
end
