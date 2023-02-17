require 'rails_helper' 

RSpec.describe "Astronauts Index Page" do 
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


  describe "when visiting the astronauts index page" do 
    it 'has a list of astronauts with their attributes' do 
      visit "/astronauts"

      within("##{@astronaut_1.id}") do 
        expect(page).to have_content(@astronaut_1.name)
        expect(page).to have_content(@astronaut_1.age)
        expect(page).to have_content(@astronaut_1.job)
      end

      within("##{@astronaut_2.id}") do 
        expect(page).to have_content(@astronaut_2.name)
        expect(page).to have_content(@astronaut_2.age)
        expect(page).to have_content(@astronaut_2.job)
      end

      within("##{@astronaut_3.id}") do 
        expect(page).to have_content(@astronaut_3.name)
        expect(page).to have_content(@astronaut_3.age)
        expect(page).to have_content(@astronaut_3.job)
      end
    end

    it 'lists the average age of all astronauts' do 
      visit "/astronauts"

      within(".average_age") do 
        expect(page).to have_content("Average Age: 34")
      end
    end

    it 'has a list of space missions in alphabetical order for each astronaut' do 
      visit "/astronauts"

      within("##{@astronaut_1.id}") do 
        expect(@mission_2.title).to appear_before(@mission_3.title)
        expect(@mission_3.title).to appear_before(@mission_1.title)
      end

      within("##{@astronaut_2.id}") do 
        expect(@mission_2.title).to appear_before(@mission_1.title)
    
      end

      within("##{@astronaut_3.id}") do 
        expect(@mission_2.title).to appear_before(@mission_3.title)
        expect(@mission_3.title).to appear_before(@mission_1.title)
      end
    end

    it 'shows the total time in space for each astronaut' do 
      visit "/astronauts" 

      within("##{@astronaut_1.id}") do 
        expect(page).to have_content("#{@astronaut_1.total_time_in_space} days")
      end

      within("##{@astronaut_2.id}") do 
        expect(page).to have_content("#{@astronaut_2.total_time_in_space} days")
      end

      within("##{@astronaut_3.id}") do 
        expect(page).to have_content("#{@astronaut_3.total_time_in_space} days")
      end
    end
  end
end