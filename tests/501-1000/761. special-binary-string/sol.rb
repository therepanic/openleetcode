# @param {String} s
# @return {String}
def make_largest_special(s)
  count = 0
  i = 0
  res = []
  
  s.each_char.with_index do |c, j|
    count += (c == '1' ? 1 : -1)
    
    if count == 0
      res << '1' + make_largest_special(s[i + 1...j]) + '0'
      i = j + 1
    end
  end
  
  res.sort.reverse.join
end
