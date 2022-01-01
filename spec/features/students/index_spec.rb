require 'rails_helper'

RSpec.describe 'students index page' do
  before :each do
    @student_1 = Student.create!(name: 'Harry', age: 10, house: Griff)
    @student_1 = Student.create!(name: 'Malfoy', age: 11, house: Slytherin)
    @student_1 = Student.create!(name: 'Ron', age: 12, house: Griff)
  end
  it 'lists all students with name, age and house' do
    visit '/students'
    expect(page).to have_content('Harry')
    expect(page).to have_content(10)
    expect(page).to have_content('Griff')
    expect(page).to have_content('Malfoy')
    expect(page).to have_content(11)
    expect(page).to have_content('Slytherin')
    expect(page).to have_content('Ron')
    expect(page).to have_content(12)
    expect(page).to have_content('Griff')
  end
end
