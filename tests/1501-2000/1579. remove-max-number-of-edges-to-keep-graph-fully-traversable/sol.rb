# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)
  edges.sort_by! { |e| -e[0] }
  parentA = (0..n).to_a
  parentB = (0..n).to_a
  rankA = Array.new(n + 1, 0)
  rankB = Array.new(n + 1, 0)

  find = ->(parent, x) {
    if parent[x] != x
      parent[x] = find.call(parent, parent[x])
    end
    parent[x]
  }

  union = ->(parent, rank, x, y) {
    root_x = find.call(parent, x)
    root_y = find.call(parent, y)
    return false if root_x == root_y
    if rank[root_x] < rank[root_y]
      parent[root_x] = root_y
    elsif rank[root_x] > rank[root_y]
      parent[root_y] = root_x
    else
      parent[root_x] = root_y
      rank[root_y] += 1
    end
    true
  }

  removed = 0
  alice_edges = 0
  bob_edges = 0
  edges.each do |e|
    if e[0] == 3
      if union.call(parentA, rankA, e[1], e[2])
        union.call(parentB, rankB, e[1], e[2])
        alice_edges += 1
        bob_edges += 1
      else
        removed += 1
      end
    elsif e[0] == 2
      if union.call(parentB, rankB, e[1], e[2])
        bob_edges += 1
      else
        removed += 1
      end
    else
      if union.call(parentA, rankA, e[1], e[2])
        alice_edges += 1
      else
        removed += 1
      end
    end
  end
  bob_edges == n - 1 && alice_edges == n - 1 ? removed : -1
end
