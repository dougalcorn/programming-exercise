require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  should_validate_presence_of :name

  context "with a string setting" do
    setup do
      @setting = Factory(:setting, :name => "Global Setting", :type => "String")
    end
    should_change "Setting.count", :by => 1
  end
end
