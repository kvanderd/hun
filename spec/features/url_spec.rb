require 'spec_helper'


describe "urls"  do
	let!(:url) { FactoryGirl.create(:url) }

	context "url has not been shortened" do
		before(:each) do
			visit root_path
		end

		it "should contain the words shorten!" do
			page.has_content?("shorten!")
		end
	end

	context " url has been shortened" do
		before(:each) do
			visit root_path
			fill_in "url[long]", with: url.long
			click_button("shorten!")
		end

		it "should show the short url on the page linking to the long url" do
			page.has_link?(url.long)
			page.has_content?(url.short)
		end
	end
end

