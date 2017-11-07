class Test < ApplicationRecord
  validates_presence_of :name
  has_many :questions, dependent: :destroy
end
