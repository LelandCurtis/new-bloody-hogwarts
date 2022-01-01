require 'rails_helper'

RSpec.describe 'students show page' do
  before :each do
    @student_1 = Student.create!(name: 'Harry', age: 10, house: 'Griff')

    @course_1 = Course.create!(name: 'Herbology')
    @course_2 = Course.create!(name: 'Defense against the Dark Arts')
    @course_3 = Course.create!(name: 'Potions')

    student_course_1 = StudentCourse.create!(student_id: @student_1.id, course_id: @course_1.id)
    student_course_1 = StudentCourse.create!(student_id: @student_1.id, course_id: @course_2.id)
  end

  it "displays all the courses of the chosen student" do
    visit '/students/1'
    expect(page).to have_content('Herbology')
    expect(page).to have_content('Defense against the Dark Arts')
    expect(page).to_not have_content('Potions')
  end
end
