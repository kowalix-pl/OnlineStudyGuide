class CertificationsController < ApplicationController
  before_action :ensure_lecturer
  before_action :set_certification, only: [:show, :edit, :update, :destroy]

  # GET /certifications
  # GET /certifications.json
  def index
    @certifications = Certification.all
  end

  # GET /certifications/1
  # GET /certifications/1.json
  def show
  end

  # GET /certifications/new
  def new
    @certification = Certification.new
  end

  # GET /certifications/1/edit
  def edit
  end

  # POST /certifications
  # POST /certifications.json
  def create
    @certification = Certification.new(certification_params)

    respond_to do |format|
      if @certification.save
        format.html { redirect_to @certification, notice: 'Certification was successfully created.' }
        format.json { render :show, status: :created, location: @certification }
      else
        format.html { render :new }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certifications/1
  # PATCH/PUT /certifications/1.json
  def update
    respond_to do |format|
      if @certification.update(certification_params)
        format.html { redirect_to @certification, notice: 'Certification was successfully updated.' }
        format.json { render :show, status: :ok, location: @certification }
      else
        format.html { render :edit }
        format.json { render json: @certification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certifications/1
  # DELETE /certifications/1.json
  def destroy
    @certification.destroy
    respond_to do |format|
      format.html { redirect_to certifications_url, notice: 'Certification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_certifications
    @certification = Certification.find(params[:certification_id])
    @possible_grades = [["",0],["A", 5],["B",4],["C", 3],["D",2],["F",1]]
    @assigned_grades = {}
    @certification.user_certifications.each do |user_certification|
     @assigned_grades[user_certification.user_id]=user_certification.grade
    end 
  end 

  def update_certifications
    @certification = Certification.find(params[:certification_id])
    params["grades"].each do |user_id,grade|
     user_certification = @certification.user_certifications.find_or_create_by(user_id: user_id)
     user_certification.grade = grade
     user_certification.save
    end

    flash[:notice]="The grades have been updated!"
    redirect_to action: :edit_certifications
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certification
      @certification = Certification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def certification_params
      params.require(:certification).permit(:name)
    end

    def ensure_lecturer
     unless current_user.lecturer 
      flash[:error]= "You have to be a lecturer to access this resource!"
      redirect_to root_url
     end 
    end 
end
