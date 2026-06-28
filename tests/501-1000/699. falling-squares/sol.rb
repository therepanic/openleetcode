# @param {Integer[][]} positions
# @return {Integer[]}
def falling_squares(positions)
  ans = []
  pos = Set.new
  positions.each do |l, side|
    pos.add(l)
    pos.add(l + side - 1)
  end
  pos = pos.to_a.sort
  mp = {}
  pos.each_with_index { |val, idx| mp[val] = idx }
  n = pos.length
  arr = Array.new(n, 0)

  tree = Array.new(4 * n, 0)
  lazy = Array.new(4 * n, 0)

  define_method(:build_tree) do |node, start, endd|
    if start == endd
      tree[node] = arr[start]
      return tree[node]
    end
    mid = (start + endd) / 2
    tree[node] = [
      build_tree(node * 2 + 1, start, mid),
      build_tree(node * 2 + 2, mid + 1, endd)
    ].max
    tree[node]
  end

  define_method(:query_helper) do |node, start, endd, left, right|
    if lazy[node] != 0
      tree[node] = [tree[node], lazy[node]].max
      if start != endd
        lazy[node * 2 + 1] = lazy[node]
        lazy[node * 2 + 2] = lazy[node]
      end
      lazy[node] = 0
    end

    if start >= left && endd <= right
      return tree[node]
    end

    if start > right || endd < left
      return 0
    end

    mid = (start + endd) / 2
    [
      query_helper(node * 2 + 1, start, mid, left, right),
      query_helper(node * 2 + 2, mid + 1, endd, left, right)
    ].max
  end

  define_method(:update_helper) do |node, start, endd, left, right, val|
    if lazy[node] != 0
      tree[node] = [tree[node], lazy[node]].max
      if start != endd
        lazy[node * 2 + 1] = lazy[node]
        lazy[node * 2 + 2] = lazy[node]
      end
      lazy[node] = 0
    end

    if start > right || endd < left || start > endd
      return
    end

    if start >= left && endd <= right
      tree[node] = val
      if start != endd
        lazy[node * 2 + 1] = val
        lazy[node * 2 + 2] = val
      end
      return
    end

    mid = (start + endd) / 2
    update_helper(node * 2 + 1, start, mid, left, right, val)
    update_helper(node * 2 + 2, mid + 1, endd, left, right, val)
    tree[node] = [tree[node * 2 + 1], tree[node * 2 + 2]].max
  end

  define_method(:query) do |left, right|
    query_helper(0, 0, n - 1, left, right)
  end

  define_method(:update_range) do |left, right, val|
    update_helper(0, 0, n - 1, left, right, val)
  end

  build_tree(0, 0, n - 1) if n > 0

  positions.each do |l, side|
    left = mp[l]
    right = mp[l + side - 1]
    mx = query(left, right)
    update_range(left, right, mx + side)
    ans << query(0, n - 1)
  end
  ans
end
