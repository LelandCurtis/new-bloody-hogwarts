class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses
  validates :name, presence: true
  validates :age, presence: true
  validates :house, presence: true

  def self.avg_age
    average(:age).round(2)
  end
end
