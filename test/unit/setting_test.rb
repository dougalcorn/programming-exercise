require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  should_validate_presence_of :name

  context "with a string setting" do
    setup do
      @setting = Factory(:setting, :name => "Global Setting")
    end
    should_change "Setting.count", :by => 1

    context "using [] as an accessor" do
      setup do
        @setting.update_attributes(:value => "value")
        @found_setting = Setting["Global Setting"]
      end
      should "have the right value" do
        assert_equal "value", @found_setting.value
      end
    end
  end
end
