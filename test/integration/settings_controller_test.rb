require 'test_helper'

class SettingsControllerTest < ActionController::IntegrationTest

  context "GET settings index" do
    setup do
      @name = "new setting #{Time.now.to_i}"
      visit settings_path
    end

    context "creating a new setting" do
      setup do
        click_link "New Setting"
        fill_in "Name", :with => @name
        click_button "Save"
      end
      should_change "Setting.count", :by => 1
    end

    context "creating a boolean setting" do
      setup do
        click_link "New Setting"
        fill_in "Name", :with => @name
        select "Boolean"
        click_button "Save"
      end
      should_change "BooleanSetting.count", :by => 1
    end
  end
end
