require 'test_helper'

class FloatSettingTest < ActiveSupport::TestCase
  context "with a float setting" do
    setup do
      @setting = Factory(:setting, :type => "FloatSetting")
    end
    should_change "Setting.count", :by => 1
    should_change "FloatSetting.count", :by => 1
  end

  should_allow_values_for :value, "1", "123", "1.1", "1231.123123"
  should_not_allow_values_for :value, "true", "some string", :message => %r/must be a float/
end
