class BooleanSetting < Setting

  # here's the trick. because the value is defined as a string I need
  # to manually convert it to a boolean.
  def value
    case this_value = read_attribute(:value)
    when /^0*$/, 0, nil, "false"
      false
    else
      true
    end
  end
end
