# @param {String} s
# @return {String}
def reformat(s)
  digits = s.chars.select { |c| c =~ /\d/ }
  letters = s.chars.select { |c| c =~ /[a-zA-Z]/ }
  if (digits.length - letters.length).abs >= 2
    return ""
  end
  ans = Array.new(s.length)
  if digits.length > letters.length
    ans.each_index { |i| ans[i] = i.even? ? digits[i/2] : letters[i/2] }
  else
    ans.each_index { |i| ans[i] = i.even? ? letters[i/2] : digits[i/2] }
  end
  ans.join
end
