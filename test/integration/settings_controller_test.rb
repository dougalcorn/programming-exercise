require 'test_helper'

class SettingsControllerTest < ActionController::IntegrationTest

  context "GET settings index" do
    setup do
      visit settings_path
    end

    context "creating a new setting" do
      setup do
        @name = "new setting #{Time.now.to_i}"
        click_link "New Setting"
        fill_in "Name", :with => @name
        click_button "Save"
      end
      should_change "Setting.count", :by => 1
    end
  end
end
