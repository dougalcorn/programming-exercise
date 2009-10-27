require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  setup :create_setting

  should_validate_presence_of :name
  should_validate_uniqueness_of :name

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

      context "cache hits on the [] accessor" do
        setup do
          @found_setting = Setting["Global Setting"]
        end
        before_should "not call the underlying finder" do
          flexmock(Setting).should_receive(:find_by_name).never
        end
        should "still find the setting" do
          assert_equal @setting, @found_setting
        end
      end
    end
  end

  private

  def create_setting
    Setting.create!(:name => "Foo #{Time.now.to_i}")
  end
end
