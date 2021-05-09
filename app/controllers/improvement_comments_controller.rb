class ImprovementCommentsController < ApplicationController
  before_action :get_improvement
  before_action :authenticate_user
  def new
    @improvement = Improvement.find(params["improvement_id"])
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
        #format.json { render :show, status: :created, location: @improvement }
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

    def get_improvement
      @improvement = Improvement.find(params[:improvement_id])
    end

end
