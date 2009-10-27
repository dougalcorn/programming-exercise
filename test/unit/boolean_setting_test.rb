require 'test_helper'

class BooleanSettingTest < ActiveSupport::TestCase
  context "with a boolean setting" do
    setup do
      @setting = BooleanSetting.create!(:name => "boolean setting")
    end
    should_change "Setting.count", :by => 1
    should_change "BooleanSetting.count", :by => 1

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
  end
end
