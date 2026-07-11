# @param {Integer[][]} board
# @return {Integer}
def snakes_and_ladders(board)
    n = board.length
    min_rolls = Array.new(n * n + 1, -1)
    q = [1]
    min_rolls[1] = 0

    while !q.empty?
        x = q.shift
        (1..6).each do |i|
            t = x + i
            break if t > n * n
            row = (t - 1) / n
            col = (t - 1) % n
            if row % 2 == 1
                c = n - 1 - col
            else
                c = col
            end
            v = board[n - 1 - row][c]
            y = v > 0 ? v : t
            return min_rolls[x] + 1 if y == n * n
            if min_rolls[y] == -1
                min_rolls[y] = min_rolls[x] + 1
                q.push(y)
            end
        end
    end
    -1
end
