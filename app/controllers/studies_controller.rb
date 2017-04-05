class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:edit, :destroy]

  # GET /studies
  # GET /studies.json
  def index
   @studies = Study.where(status: 'public')
  end

  # GET /studies/1
  # GET /studies/1.json
  def show
  end

  # GET /studies/new
  def new
    @study = Study.new
  end

  # GET /studies/1/edit
  def edit
  end

  # POST /studies
  # POST /studies.json
  def create
    @study = Study.new(study_params)

    respond_to do |format|
      if @study.save
        format.html { redirect_to @study, notice: 'Study was successfully created.' }
        format.json { render :show, status: :created, location: @study }
      else
        format.html { render :new }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /studies/1
  # PATCH/PUT /studies/1.json
  def update
    respond_to do |format|
      if @study.update(study_params)
        format.html { redirect_to @study, notice: 'Study was successfully updated.' }
        format.json { render :show, status: :ok, location: @study }
      else
        format.html { render :edit }
        format.json { render json: @study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /studies/1
  # DELETE /studies/1.json
  def destroy
    @study.destroy
    respond_to do |format|
      format.html { redirect_to studies_url, notice: 'Study was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_params
      params.fetch(:study, {})
      params.require(:study).permit(:utf8, :authenticity_token, :commit, :_method, :id, :title, :detailed_description, :url, :contact_info, :status, :brief_summary, :submitter_name, :email, :file, :image_file, :remote_image_url,:pwd)
    end

    def authenticate_user
      if !params[:pwd] and !params['study']
        render plain: "First  Only editable by authorized folks."
      end
      if params[:pwd] and params[:pwd] != ENV["PTN_PASSWORD"]
        render plain: "Second   Only editable by authorized folks."
      end
      if params['study'] and (!params['study']['pwd'] or params['study']['pwd'] != ENV["PTN_PASSWORD"])
        render plain: "Third   Only editable by authorized folks."
      end
    end
end
