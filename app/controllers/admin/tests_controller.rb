class Admin::TestsController < AdminController
  before_action :set_test, only: [:edit, :update, :show, :destroy]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      flash[:success] = 'Test Added, Please do add the Questions'
      redirect_to admin_test_path(@test)
    else
      flash[:error] = 'Test Not created'
      render :new
    end
  end

  def show
    @questions = @test.questions
    @question = @test.questions.build
    @option = @question.options.build
  end

  def assign_test
    @user = User.find(params[:test][:quiz_id])
    @test = Test.find(params[:test_id])
    @user.tests << @test
    score(@test)
    @test.assign_test
    if @test.save
      flash[:success] = "User assigned with test"
      redirect_to admin_test_path(@test)
    else
      flash[:error] = 'Test not updated'
      redirect_to admin_test_path(@test)
    end

  end

  private
  def test_params
    params.require(:test).permit(:name, :quiz_id, questions_attributes: [:context])
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def score(quiz)
    quiz.score_obtained = 0
    quitotal_score = quiz.questions.count * 10
  end
end
