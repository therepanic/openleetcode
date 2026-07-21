# @param {String} s
# @return {String}
def freq_alphabets(s)
  decoded = []
  index = 0
  while index < s.length
    if index + 2 < s.length && s[index + 2] == '#'
      decoded << (('a'.ord) + s[index, 2].to_i - 1).chr
      index += 3
    else
      decoded << (('a'.ord) + s[index].to_i - 1).chr
      index += 1
    end
  end
  decoded.join
end
