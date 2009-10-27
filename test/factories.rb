Factory.define(:setting) do |f|
  f.sequence(:name) { |i| "Setting #{i}"}
end
