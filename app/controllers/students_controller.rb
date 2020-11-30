class StudentsController < ApplicationController
  before_action :authenticate_user!
  
  def certified_students
    @passed_certificates = UserCertification.passed_certifications
  end 
end 