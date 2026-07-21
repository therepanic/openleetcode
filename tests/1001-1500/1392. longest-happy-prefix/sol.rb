# @param {String} s
# @return {String}
def longest_prefix(s)
  n = s.length
  prefix = Array.new(n, 0)
  matched = 0
  (1...n).each do |i|
    while matched > 0 && s[i] != s[matched]
      matched = prefix[matched - 1]
    end
    if s[i] == s[matched]
      matched += 1
    end
    prefix[i] = matched
  end
  s[0...prefix[-1]]
end
