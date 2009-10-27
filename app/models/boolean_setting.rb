class BooleanSetting < Setting

  # here's the trick. because the value is defined as a string I need
  # to manually convert it to a boolean.
  def value
    false?(read_attribute(:value))
  end

  def value=(arg)
    write_attribute(:value, false?(arg) ? arg : "false")
    false?(arg)
  end

  private

  def false?(value)
    @@false_values ||= { }
    @@false_values[value] ||= case value
                              when /^0*$/, 0, nil, "false", false
                                false
                              else
                                true
                              end
  end
end
