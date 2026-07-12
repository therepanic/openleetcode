# @param {String} s1
# @param {String} s2
# @param {String} base_str
# @return {String}
def smallest_equivalent_string(s1, s2, base_str)
  adj = Hash.new { |h, k| h[k] = [] }
  s1.chars.zip(s2.chars).each do |a, b|
    adj[a] << b
    adj[b] << a
  end

  dfs = lambda do |ch, visited|
    visited.add(ch)
    min_ch = ch
    adj[ch].each do |nei|
      unless visited.include?(nei)
        candidate = dfs.call(nei, visited)
        min_ch = [min_ch, candidate].min
      end
    end
    min_ch
  end

  result = []
  base_str.each_char do |ch|
    visited = Set.new
    result << dfs.call(ch, visited)
  end
  result.join
end
