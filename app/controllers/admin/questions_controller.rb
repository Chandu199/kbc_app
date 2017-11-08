class Admin::QuestionsController < AdminController
  before_action :set_test

  def create
    @question = @test.questions.build(question_params)
    @option = @question.options.build

    if @question.save
      flash[:success] = 'Added the Question'
      respond_to do |format|
        format.js
      end
      # redirect_to admin_test_path(@test)
    else
      flash[:error] = 'Question Not added'
      respond_to do |format|
        format.js
      end
      # redirect_to admin_tests_path(@test)
    end
  end

  private
  def question_params
    params.require(:question).permit(:context, :test_id, options_attributes: [:description, :answer])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end
end
