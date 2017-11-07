class Question < ApplicationRecord
  belongs_to :test
  has_many :options, inverse_of: :question, dependent: :destroy

  accepts_nested_attributes_for :options
end
