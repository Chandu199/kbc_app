class AnswerPaper < ApplicationRecord
  belongs_to :user

  def initialize question_ids, test_id, user_id
    @questions = question_ids
    @test = test_id
    @user = user_id
  end

  def check_score

  end


end
