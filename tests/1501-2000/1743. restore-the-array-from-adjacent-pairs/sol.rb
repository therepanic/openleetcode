def restore_array(adjacent_pairs)
  xor_map = Hash.new(0)
  degree = Hash.new(0)

  adjacent_pairs.each do |u, v|
    xor_map[u] ^= v
    xor_map[v] ^= u
    degree[u] += 1
    degree[v] += 1
  end

  start = 0
  degree.each do |k, v|
    if v == 1
      start = k
      break
    end
  end

  n = adjacent_pairs.length + 1
  res = Array.new(n, 0)

  res[0] = start
  prev = 0

  (1...n).each do |i|
    res[i] = xor_map[res[i - 1]] ^ prev
    prev = res[i - 1]
  end

  res
end
