class ImprovementCommentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_improvement

  def new
    @improvement_comment = ImprovementComment.new
  end

  # POST /improvements or /improvements.json
  def create
    @improvementcomment = ImprovementComment.new(improvement_comment_params)
    @improvementcomment.user = current_user
    @improvementcomment.improvement = @improvement
    respond_to do |format|
      if @improvementcomment.save
        format.html { redirect_to @improvement, notice: "Comment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @improvementcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_improvement
    @improvement = Improvement.find_by(id: params["improvement_id"])
    if @improvement.nil?
      flash[:notice] = "Improvement not found"
      redirect_back(fallback_location: improvements_path)
    end

    if !@improvement.visible?(current_user)
      flash[:notice] = "Inadequate Permissions"
      redirect_back(fallback_location: improvements_path)
    end
  end

  def improvement_comment_params
    params.require(:improvement_comment).permit(:title, :body, :improvement_id)
  end

end
