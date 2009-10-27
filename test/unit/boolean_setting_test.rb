require 'test_helper'

class BooleanSettingTest < ActiveSupport::TestCase
  context "with a boolean setting" do
    setup do
      @setting = BooleanSetting.create!(:name => "boolean setting")
    end
    should_change "Setting.count", :by => 1
    should_change "BooleanSetting.count", :by => 1

    should "save the value as false when setting as false" do
      @setting.update_attributes(:value => false)
      assert_equal false, @setting.reload.value
    end

    ["0", "00", 0, nil, "", "false"].each do |value|
      should "be false with #{value.inspect} value" do
        @setting.update_attributes(:value => value)
        assert_equal false, @setting.value, "wasn't false for #{value}"
      end
    end

    should "be true with some non-false value" do
      @setting.update_attributes(:value => "some random stuff")
      assert_equal true, @setting.value
    end

    context "using [] accessor" do
      setup do
        @setting.update_attributes(:value => false)
        @found_setting = Setting["boolean setting"]
      end
      should "be a boolean setting" do
        assert_kind_of BooleanSetting, @found_setting
      end
      should "have the right value" do
        assert_equal false, @found_setting.value
      end
    end
  end
end
