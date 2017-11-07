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
      falsh[:error] = 'Test Not created'
      render :new
    end
  end

  def show
    @question = @test.questions.build
    @questions = @test.questions
    @option = @question.options.build
  end

  private
  def test_params
    params.require(:test).permit(:name, questions_attributes: [:context])
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
