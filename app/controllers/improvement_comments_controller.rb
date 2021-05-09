class ImprovementCommentsController < ApplicationController
  before_action :authenticate_user

  def new
    @improvement = Improvement.find(params["improvement_id"])
    @improvement_comment = ImprovementComment.new
  end

  # POST /improvements or /improvements.json
  def create
    @improvement = Improvement.find(params[:improvement_id])
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
    def improvement_comment_params
      params.require(:improvement_comment).permit(:title, :body, :improvement_id)
    end

end
