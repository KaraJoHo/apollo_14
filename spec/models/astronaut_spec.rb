require 'rails_helper'

describe Astronaut, type: :model do
  before(:each) do 
    @astronaut_1 = Astronaut.create!(name: "Joe Fly", age: 32, job: "Pilot")
    @astronaut_2 = Astronaut.create!(name: "Tim Space", age: 30, job: "Navigator")
    @astronaut_3 = Astronaut.create!(name: "Bob", age: 40, job: "Mechanic")

    @mission_1 = Mission.create!(title: "Moon", time_in_space: 120)
    @mission_2 = Mission.create!(title: "Jupiter", time_in_space: 500) 
    @mission_3 = Mission.create!(title: "Mars", time_in_space: 250)

    @astronaut_mission_1 = AstronautMission.create!(astronaut_id: @astronaut_1.id, mission_id: @mission_1.id)
    @astronaut_mission_2 = AstronautMission.create!(astronaut_id: @astronaut_1.id, mission_id: @mission_2.id)
    @astronaut_mission_3 = AstronautMission.create!(astronaut_id: @astronaut_1.id, mission_id: @mission_3.id)
    @astronaut_mission_4 = AstronautMission.create!(astronaut_id: @astronaut_2.id, mission_id: @mission_1.id)
    @astronaut_mission_5 = AstronautMission.create!(astronaut_id: @astronaut_2.id, mission_id: @mission_2.id)
    @astronaut_mission_6 = AstronautMission.create!(astronaut_id: @astronaut_3.id, mission_id: @mission_1.id)
    @astronaut_mission_7 = AstronautMission.create!(astronaut_id: @astronaut_3.id, mission_id: @mission_2.id)
    @astronaut_mission_8 = AstronautMission.create!(astronaut_id: @astronaut_3.id, mission_id: @mission_3.id)
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

  describe '#order_missions_by_alphabetical' do 
    it 'lists the astronauts mission names in alphabetical order' do 
      expect(@astronaut_1.order_mission_names_by_alphabetical).to eq(["Jupiter", "Mars", "Moon"])
    end
  end

  describe '#total_time_in_space' do 
    it 'is the astronauts total time in space across all their missions' do 
      expect(@astronaut_1.total_time_in_space).to eq(870)
    end
  end
end
