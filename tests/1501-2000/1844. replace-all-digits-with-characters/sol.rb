# @param {String} s
# @return {String}
def replace_digits(s)
  s = s.chars
  (1...s.length).step(2).each do |i|
    ch = s[i - 1]
    digit = s[i].to_i
    s[i] = (ch.ord + digit).chr
  end
  s.join
end
