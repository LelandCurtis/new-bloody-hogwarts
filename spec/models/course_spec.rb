require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    before :each do
      @student_1 = Student.create!(name: 'Harry', age: 10, house: 'Griff')
      @student_2 = Student.create!(name: 'Malfoy', age: 11, house: 'Slytherin')
      @student_3 = Student.create!(name: 'Ron', age: 12, house: 'Griff')

      @course_1 = Course.create!(name: 'Herbology')
      @course_2 = Course.create!(name: 'Defense against the Dark Arts')
      @course_3 = Course.create!(name: 'Potions')

      @student_course_1 = StudentCourse.create!(student_id: @student_1.id, course_id: @course_1.id)
      @student_course_2 = StudentCourse.create!(student_id: @student_1.id, course_id: @course_2.id)
      @student_course_3 = StudentCourse.create!(student_id: @student_2.id, course_id: @course_3.id)
      @student_course_4 = StudentCourse.create!(student_id: @student_3.id, course_id: @course_2.id)
      @student_course_5 = StudentCourse.create!(student_id: @student_3.id, course_id: @course_3.id)
    end

    describe 'student_count' do
      it "returns the number of students enrolled" do
        expect(@course_1.student_count).to eq(1)
        expect(@course_2.student_count).to eq(2)
        expect(@course_3.student_count).to eq(2)
      end
    end
  end

end
