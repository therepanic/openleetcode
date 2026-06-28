# @param {Integer[][]} board
# @return {Integer}
def moves_to_chessboard(board)
    n = board.length
    
    fn = lambda do |vals|
        total = 0
        odd = 0
        vals.each_with_index do |x, i|
            if vals[0] == x
                total += 1
                odd += 1 if i & 1 == 1
            elsif vals[0] ^ x != (1 << n) - 1
                return Float::INFINITY
            end
        end
        ans = Float::INFINITY
        if n <= 2 * total && 2 * total <= n + 1
            ans = [ans, odd].min
        end
        if n - 1 <= 2 * total && 2 * total <= n
            ans = [ans, total - odd].min
        end
        ans
    end
    
    rows = [0] * n
    cols = [0] * n
    (0...n).each do |i|
        (0...n).each do |j|
            if board[i][j] == 1
                rows[i] ^= 1 << j
                cols[j] ^= 1 << i
            end
        end
    end
    ans = fn.call(rows) + fn.call(cols)
    ans < Float::INFINITY ? ans.to_i : -1
end
