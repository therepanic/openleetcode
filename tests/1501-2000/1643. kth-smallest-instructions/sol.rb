# @param {Integer[]} destination
# @param {Integer} k
# @return {String}
def kth_smallest_path(destination, k)
  rows, cols = destination
  path = []
  k -= 1

  while rows > 0 || cols > 0
    if cols > 0
      paths_with_h = combination(rows + cols - 1, cols - 1)
    else
      paths_with_h = 0
    end

    if k < paths_with_h
      path << 'H'
      cols -= 1
    else
      path << 'V'
      k -= paths_with_h
      rows -= 1
    end
  end

  path.join
end

def combination(n, r)
  return 1 if r == 0 || r == n
  r = [r, n - r].min
  result = 1
  (1..r).each do |i|
    result = result * (n - r + i) / i
  end
  result
end
