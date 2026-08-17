class GcdSortUnionFind
  def initialize(n)
    @parent = (0...n).to_a
    @size = Array.new(n, 1)
  end
  def find(x)
    while @parent[x] != x
      @parent[x] = @parent[@parent[x]]
      x = @parent[x]
    end
    x
  end
  def union(a, b)
    a = find(a); b = find(b); return if a == b
    a, b = b, a if @size[a] < @size[b]
    @parent[b] = a; @size[a] += @size[b]
  end
  def connected?(a, b); find(a) == find(b); end
end

def gcd_sort(nums)
  uf = GcdSortUnionFind.new(nums.max + 1)
  nums.each do |value|
    x = value; factor = 2
    while factor * factor <= x
      if x % factor == 0
        uf.union(factor, value)
        x /= factor while x % factor == 0
      end
      factor += 1
    end
    uf.union(x, value) if x > 1
  end
  sorted = nums.sort
  nums.each_index { |i| return false unless uf.connected?(nums[i], sorted[i]) }
  true
end
