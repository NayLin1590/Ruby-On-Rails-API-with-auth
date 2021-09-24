class ApplicantsController < ApplicationController
  before_action :authorized, except: [:confirm, :create ]
  def index
    @applicants = Applicant.all
    render json: @applicants
  end

  # def fileread
  #   path = "app/assets/images/CB_Logo_.png"
  #   data = File.open(path, 'rb') {|file| file.read }
  #   imgfile = "data:image/jpg;base64,#{Base64.encode64(data)}"
  #   render html:"<img alt='test' src='#{imgfile}'>".html_safe
  # end

  def create 
    if params
      name = params[:imgfile].original_filename
      path = File.join("app", "assets" , "images" ,name)
      File.open(path, "wb") { |f| f.write(params[:imgfile].read) }

      @applicant = Applicant.new(applicant_params)
      if @applicant.save
        render json: {"response":"ok"} , status: 200
      else
        render json: @applicant.errors, status: :unprocessable_entity
      end
    else
      render json: {"name":"blank"} , status: 400
    end
   
  end

  def confirm
    @applicant = Applicant.new(applicant_params)
    # render json: params
    if !@applicant.valid?      
      render json: @applicant.errors , status: 300
    else
      render  json: @applicant, status: 200
    end
  end
  # GET 
  def detail
    applicant = Applicant.find(params[:id])
    filename = applicant.profilePhoto
    path = "app/assets/images/"+filename
    data = File.open(path, 'rb') {|file| file.read }
    imgfile = "data:image;base64,#{Base64.encode64(data)}"
    applicant.profilePhoto = imgfile
    dob = applicant.dob.strftime('%Y-%m-%d')
    render json: { "applicant":applicant, "dob":dob }
  end

  def destroy
    if Applicant.find(params[:id]).destroy
      render json: { "text":"ok"}
    else
      render json: {"text":"not Ok"} , status: 500
    end
  end
  private
    def applicant_params
      params.permit(:name, :profilePhoto, :dob, :phone_no1, :phone_no2, :email, :currentAddress, :hometownAddress, :bachelorUni, :bachelorYear, :bachelorDegree, :masterUni, :masterYear, :masterDegree, :diplomaName, :certificate, :programming, :english, :japanese, :otherLang, :internshipInfo, :jobExperience, :totalExperience, :created_by, :updated_by)
    end

end
