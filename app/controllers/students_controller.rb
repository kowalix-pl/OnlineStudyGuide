class StudentsController < ApplicationController
  def certified_students
    @passed_certificates = UserCertification.passed_certifications
  end 
end 