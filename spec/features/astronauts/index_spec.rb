require 'rails_helper' 

RSpec.describe "Astronauts Index Page" do 
  before(:each) do 
    @astronaut_1 = Astronaut.create!(name: "Joe Fly", age: 32, job: "Pilot")
    @astronaut_2 = Astronaut.create!(name: "Tim Space", age: 30, job: "Navigator")
    @astronaut_3 = Astronaut.create!(name: "Bob", age: 40, job: "Mechanic")
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

      within(".average_age") do 
        expect(page).to have_content("Average Age: 34")
      end

    end
  end
end