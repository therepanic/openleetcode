# @param {String} num
# @return {Boolean}
def is_additive_number(num)
  f = ->(a, b, s) {
    return true if s.empty?
    c = (a + b).to_s
    s.start_with?(c) && f.call(b, c.to_i, s[c.length..-1])
  }

  (1...num.length).each do |i|
    (i + 1...num.length).each do |j|
      next if (num[0] == '0' && i > 1) || (num[i] == '0' && j > i + 1)
      return true if f.call(num[0...i].to_i, num[i...j].to_i, num[j..-1])
    end
  end
  false
end
