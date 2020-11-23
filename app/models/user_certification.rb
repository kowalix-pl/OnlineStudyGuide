class UserCertification < ApplicationRecord
  belongs_to :user
  belongs_to :certification

  def self.passed_certifications
    where("grade > ?",1)
  end 

end
