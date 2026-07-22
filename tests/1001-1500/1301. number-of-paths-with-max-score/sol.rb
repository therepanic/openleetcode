# @param {String[]} board
# @return {Integer[]}
def paths_with_max_score(board)
  mod = 10**9 + 7
  n = board.length

  next_score = Array.new(n + 1, -1)
  next_ways = Array.new(n + 1, 0)

  (n - 1).downto(0) do |i|
    curr_score = Array.new(n + 1, -1)
    curr_ways = Array.new(n + 1, 0)

    (n - 1).downto(0) do |j|
      cell = board[i][j]

      next if cell == 'X'

      if cell == 'S'
        curr_score[j] = 0
        curr_ways[j] = 1
        next
      end

      best = [next_score[j], curr_score[j + 1], next_score[j + 1]].max

      next if best == -1

      ways = 0

      ways += next_ways[j] if next_score[j] == best
      ways += curr_ways[j + 1] if curr_score[j + 1] == best
      ways += next_ways[j + 1] if next_score[j + 1] == best

      value = cell == 'E' ? 0 : cell.to_i

      curr_score[j] = best + value
      curr_ways[j] = ways % mod
    end

    next_score = curr_score
    next_ways = curr_ways
  end

  return [0, 0] if next_score[0] == -1

  [next_score[0], next_ways[0]]
end
