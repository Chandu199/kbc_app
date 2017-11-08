class Test < ApplicationRecord
  validates_presence_of :name

  has_many :questions, dependent: :destroy

  state_machine :state, initial: :created do
    event :assign_test do
      transition from: :created, to: :assigned
    end

    event :initiate do
      transition from: :assigned, to: :initiated
    end

    event :completed do
      transition from: :initiated, to: :completed
    end

    event :request_retake do
      transition from: :completed, to: :request_retake
    end

    event :approve_retake do
      transition from: :request_retake, to: :assigned
    end

  end

  def reinitialize_score
    self.score = 0
  end

  def update
    self.total_score = calculate_total
  end

  def notify_user
    #TODO: Send mail to user
  end

  def calculate_total
    #TODO: Calculate Total Score
  end
end
