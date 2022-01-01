require 'rails_helper'

RSpec.describe 'courses index page' do
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

  it "displays the name of all courses" do
    visit '/courses'
    expect(page).to have_content('Herbology')
    expect(page).to have_content('Defense against the Dark Arts')
    expect(page).to have_content('Potions')
  end

  it "displays the count of all students enrolled in each course" do
    visit '/courses'
    within "div.course_#{@course_1.id}" do
      expect(page).to have_content(1)
      expect(page).to_not have_content(2)
    end
    within "div.course_#{@course_2.id}" do
      expect(page).to have_content(2)
    end
  end
end
