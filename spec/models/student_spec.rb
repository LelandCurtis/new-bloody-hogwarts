require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    before :each do
      @student_1 = Student.create!(name: 'Harry', age: 10, house: 'Griff')
      @student_2 = Student.create!(name: 'Malfoy', age: 11, house: 'Slytherin')
      @student_3 = Student.create!(name: 'Ron', age: 13, house: 'Griff')
    end

    describe 'avg_age' do
      it "returns the average age of all students rounded to two digits" do
        expect(Student.avg_age).to eq(11.33)
      end
    end
  end

end
