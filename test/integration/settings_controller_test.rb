require 'test_helper'

class SettingsControllerTest < ActionController::IntegrationTest

  context "GET settings index" do
    setup do
      @name = "new setting #{Time.now.to_i}"
      visit settings_path
    end

    context "creating a new setting with invalid type" do
      setup do
        click_link "New Setting"
        fill_in "Name", :with => @name
        fill_in "Value", :with => "1.1"
        select "Integer"
        click_button "Save"
      end
      should_not_change "Setting.count"
      should "contain error on the integer" do
        assert_contain "must be an integer"
      end
    end
    context "creating a new setting" do
      setup do
        click_link "New Setting"
        fill_in "Name", :with => @name
        click_button "Save"
      end
      should_change "Setting.count", :by => 1
      context "and re-visiting the settings list" do
        setup { visit settings_path }
        should "contain the created setting's name" do
          assert_contain @name
        end
        context "editing the setting" do
          setup do 
            click_link @name
            @setting = assigns(:setting)
          end
          context "with new value" do
            setup do
              fill_in "Value", :with => "foobar"
              click_button "Save"
            end
            should_not_change "Setting.count"
            should_change "@setting.reload.value", :to => "foobar"
          end
        end
      end
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
