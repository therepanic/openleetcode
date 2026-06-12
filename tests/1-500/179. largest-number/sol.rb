def largest_number(nums)
  parts = nums.map(&:to_s)
  parts.sort! { |a, b| (b + a) <=> (a + b) }
  return "0" if !parts.empty? && parts[0] == "0"
  parts.join
end
