# @param {String} s
# @return {String}
def sort_string(s)
  return "" if s.empty?
  counts = Hash.new(0)
  s.each_char { |c| counts[c] += 1 }
  keys = counts.keys.sort_by { |x| x.ord }
  ans = ""
  while counts.values.max > 0
    keys.each do |key|
      if counts[key] > 0
        ans += key
        counts[key] -= 1
      end
    end
    keys.reverse_each do |key|
      if counts[key] > 0
        ans += key
        counts[key] -= 1
      end
    end
  end
  ans
end
