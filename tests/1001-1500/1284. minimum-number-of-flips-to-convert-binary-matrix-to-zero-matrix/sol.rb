require 'set'

def min_flips(mat)
  m = mat.length
  n = mat[0].length
  masks = []

  m.times do |r|
    n.times do |c|
      mask = 0
      [[0, 0], [1, 0], [-1, 0], [0, 1], [0, -1]].each do |dr, dc|
        nr = r + dr
        nc = c + dc
        if nr >= 0 && nr < m && nc >= 0 && nc < n
          mask |= 1 << (nr * n + nc)
        end
      end
      masks << mask
    end
  end

  start = 0
  m.times do |r|
    n.times do |c|
      start |= 1 << (r * n + c) if mat[r][c] == 1
    end
  end

  dist = Array.new(1 << (m * n), -1)
  q = [[start, 0]]
  dist[start] = 0
  head = 0

  while head < q.length
    state, steps = q[head]
    head += 1
    return steps if state == 0

    masks.each do |mask|
      nxt = state ^ mask
      next unless dist[nxt] == -1
      dist[nxt] = steps + 1
      q << [nxt, steps + 1]
    end
  end

  -1
end
