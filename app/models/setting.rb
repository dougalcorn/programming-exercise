class Setting < ActiveRecord::Base
  validates_presence_of :name
  validate :type_values

  def self.[](name)
    find_by_name(name)
  end

  private

  def type_values
    return true                 # if it's just a setting, allow any values
  end
end
