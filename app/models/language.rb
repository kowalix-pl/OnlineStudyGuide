class Language < ApplicationRecord
  belongs_to :user
  validates_inclusion_of :language_type, in:["Front end","Back end"]
end
