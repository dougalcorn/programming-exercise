class IntegerSetting < Setting
  def type_values
    return true if value.blank?
    errors.add(:value, "must be an integer") unless value =~ /^\d*$/
  end
end
