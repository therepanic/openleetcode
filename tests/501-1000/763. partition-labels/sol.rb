# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  return [1] if s.length == 1
  seen = {}
  s.each_char.with_index do |ch, i|
    if seen.key?(ch)
      seen[ch][1] = i
    else
      seen[ch] = [i, i]
    end
  end
  arr_seen = seen.values
  merged = [arr_seen[0]]
  (1...arr_seen.length).each do |i|
    if merged.last[1] >= arr_seen[i][0]
      merged.last[1] = [merged.last[1], arr_seen[i][1]].max
    else
      merged << arr_seen[i]
    end
  end
  merged.map { |start_val, end_val| end_val - start_val + 1 }
end
