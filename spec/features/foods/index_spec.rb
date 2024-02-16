require "rails_helper"

describe "the foods index page", :vcr do
    before :each do
        visit root_path

        fill_in 'search_foods', with: 'sweet potatoes'
        click_button 'Search'

        @query_upcase = 'SWEET POTATOES'
    end

    describe "happy path" do
        it "shows total number of items returned by the search" do
            expect(current_path).to eq(foods_path)
            
            # I don't like how hard coded this result is, but I couldn't figure out a way to check for an integer greater than a certain number. Would be cool
            expect(page).to have_content("Total Results: 56231") 
        end

        it "shows 10 items matching the search query, with the attributes: description, GTIN/UPC code, Brand Owner, and ingredients of items containing the search query" do
            expect(page).to have_content("Description: #{@query_upcase}", count: 10)

            # For these three, I'd like a way to test for "any" content after the line title. Maybe this is where mocks/stubs come in handy?
            expect(page).to have_content("GTIN/UPC Code:", count: 10)
            expect(page).to have_content("Brand Owner:", count: 10)
            expect(page).to have_content("Ingredients:", count: 10)
        end
    end
end