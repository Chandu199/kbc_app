class Player::TestsController < ApplicationController
  before_action :set_user
  before_action :find_question, only: [:answer_questions]

  def get_questions
    @test = @user.tests.where(state: "assigned").first
    # @test.initiate
    @questions = @test.questions if @test
    session[:score] = 0
  end

  def answer_questions
    answer = @question.options.where(answer: true).first
    @test = @user.tests.where(id: params[:question][:test_id]).first

    if params[:option] = answer.id rescue nil?
      score = session[:score]+10
      @test.score_obtained = score

      if @test.update
        respond_to do |format|
          format.js
        end
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def set_user
    @user = current_user
  end

  def find_question
    @question = Question.find(params[:question][:question_id])
  end

end
