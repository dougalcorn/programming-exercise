class FloatSetting < Setting
  def type_values
    return true if value.blank?
    errors.add(:value, "must be a float") unless value =~ /^[.\d]*$/
  end
end
