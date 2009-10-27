require 'test_helper'

class IntegerSettingTest < ActiveSupport::TestCase

  context "with an integer setting" do
    setup do
      @setting = Factory(:setting, :type => "IntegerSetting")
    end
    should_change "Setting.count", :by => 1
    should_change "IntegerSetting.count", :by => 1
  end

  should_allow_values_for :value, "1", "123", "1324123411234"
  should_not_allow_values_for :value, "1.1", "true", "some string", :message => %r/must be an integer/
end
