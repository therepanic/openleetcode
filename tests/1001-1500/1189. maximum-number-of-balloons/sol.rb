# @param {String} text
# @return {Integer}
def max_number_of_balloons(text)
  f = Hash.new(0)
  text.each_char { |c| f[c] += 1 }
  [f["b"], f["a"], f["l"] / 2, f["o"] / 2, f["n"]].min
end
