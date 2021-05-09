class ImprovementsController < ApplicationController
  before_action :set_improvement, only: %i[ show edit update destroy ]
  before_action :authenticate_user
  before_action :validate_view_user, only: %i[ show edit update destroy ]
  before_action :validate_modify_user, only: %i[ edit update destroy ]
  # GET /improvements or /improvements.json
  def index
    @improvements = Improvement.where(user: current_user)
    @publicImprovements = Improvement.where(is_private: false).where.not(user: current_user)
  end

  # GET /improvements/1 or /improvements/1.json
  def show
    @comments = ImprovementComment.where(improvement_id: params["id"])
  end

  # GET /improvements/new
  def new
    @improvement = Improvement.new
  end

  # GET /improvements/1/edit
  def edit
  end

  # POST /improvements or /improvements.json
  def create
    @improvement = Improvement.new(improvement_params)
    @improvement.user = current_user
    respond_to do |format|
      if @improvement.save
        format.html { redirect_to @improvement, notice: "Improvement was successfully created." }
        format.json { render :show, status: :created, location: @improvement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @improvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /improvements/1 or /improvements/1.json
  def update
    respond_to do |format|
      if @improvement.update(improvement_params)
        format.html { redirect_to @improvement, notice: "Improvement was successfully updated." }
        format.json { render :show, status: :ok, location: @improvement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @improvement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /improvements/1 or /improvements/1.json
  def destroy
    @improvement.destroy
    respond_to do |format|
      format.html { redirect_to improvements_url, notice: "Improvement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_improvement
      @improvement = Improvement.find_by(id: params["id"])
      if @improvement.nil?
        flash[:notice] = "Improvement not found"
        redirect_back(fallback_location: improvements_path)
      end
    end

    def validate_view_user
      if !@improvement.visible?(current_user)
        flash[:notice] = "Inadequate Permissions"
        redirect_back(fallback_location: improvements_path)
      end
    end

    def validate_modify_user
      if @improvement.user != current_user
        flash[:notice] = "Inadequate Permissions"
        redirect_back(fallback_location: improvements_path)
      end
    end

    # Only allow a list of trusted parameters through.
    def improvement_params
      params.require(:improvement).permit(:name, :description, :is_private, :estimated_effort, :actual_effort, :status)
    end
end
