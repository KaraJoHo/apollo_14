require 'rails_helper'

describe Astronaut, type: :model do
  before(:each) do 
    @astronaut_1 = Astronaut.create!(name: "Joe Fly", age: 32, job: "Pilot")
    @astronaut_2 = Astronaut.create!(name: "Tim Space", age: 30, job: "Navigator")
    @astronaut_3 = Astronaut.create!(name: "Bob", age: 40, job: "Mechanic")
  end
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe "::average_age" do 
    it 'is the average age of all astronauts' do 
      expect(Astronaut.average_age).to eq(34)

    end
  end
end
