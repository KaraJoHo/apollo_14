require 'rails_helper'

RSpec.describe "Astronaut show page" do 
  before(:each) do 
    @astronaut_1 = Astronaut.create!(name: "Joe Fly", age: 32, job: "Pilot")
    @astronaut_2 = Astronaut.create!(name: "Tim Space", age: 30, job: "Navigator")
    @astronaut_3 = Astronaut.create!(name: "Bob", age: 40, job: "Mechanic")

    @mission_1 = Mission.create!(title: "Moon", time_in_space: 120)
    @mission_2 = Mission.create!(title: "Jupiter", time_in_space: 500) 
    @mission_3 = Mission.create!(title: "Mars", time_in_space: 250)
    @mission_4 = Mission.create!(title: "Saturn", time_in_space: 800)

    @astronaut_mission_1 = AstronautMission.create!(astronaut_id: @astronaut_1.id, mission_id: @mission_1.id)
    @astronaut_mission_2 = AstronautMission.create!(astronaut_id: @astronaut_1.id, mission_id: @mission_2.id)
    @astronaut_mission_3 = AstronautMission.create!(astronaut_id: @astronaut_1.id, mission_id: @mission_3.id)
    @astronaut_mission_4 = AstronautMission.create!(astronaut_id: @astronaut_2.id, mission_id: @mission_1.id)
    @astronaut_mission_5 = AstronautMission.create!(astronaut_id: @astronaut_2.id, mission_id: @mission_2.id)
    @astronaut_mission_6 = AstronautMission.create!(astronaut_id: @astronaut_3.id, mission_id: @mission_1.id)
    @astronaut_mission_7 = AstronautMission.create!(astronaut_id: @astronaut_3.id, mission_id: @mission_2.id)
    @astronaut_mission_8 = AstronautMission.create!(astronaut_id: @astronaut_3.id, mission_id: @mission_3.id)
  end

  describe 'When visiting the astronaut show page' do 
    it 'is the name of the astronaut and a  list of the missions they have been on' do 
      visit "/astronauts/#{@astronaut_1.id}"

      within(".astronaut_details") do 
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.order_mission_names_by_alphabetical)
      end
    end

    it 'has a form to add an existing mission and redirects to show page with new mission' do 
      visit "/astronauts/#{@astronaut_1.id}" 
      # save_and_open_page

      expect(page).to have_content("Add a new mission")

      fill_in("mission_id", with: "#{@mission_4.id}")
      click_button("Submit")

      expect(current_path).to eq("/astronauts/#{@astronaut_1.id}")
 
      within(".astronaut_details") do 
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content("Saturn")
      end

    end
  end
end