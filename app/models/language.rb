class Language < ApplicationRecord
  belongs_to :user
  has_many :code_snippets
  validates_inclusion_of :language_type, in:["Front end","Back end"]
  validates_length_of :name, minimum: 1
  
end
