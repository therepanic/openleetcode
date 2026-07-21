# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  t = []
  p = 0
  s.each_char do |c|
    p += 1 if c == '('
    p -= 1 if c == ')'
    if p >= 0
      t << c
    else
      p = 0
    end
  end
  p = 0
  q = []
  t.reverse.each do |c|
    p += 1 if c == '('
    p -= 1 if c == ')'
    if p <= 0
      q.unshift(c)
    else
      p = 0
    end
  end
  q.join
end
