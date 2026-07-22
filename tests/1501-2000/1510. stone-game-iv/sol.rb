# @param {Integer} n
# @return {Boolean}
def winner_square_game(n)
    memo = {}
    dp = lambda do |player, stones|
        return false if stones == 0
        key = [player, stones]
        return memo[key] if memo.key?(key)
        sqrt = Integer.sqrt(stones)
        sqrt.downto(1) do |i|
            sq = i * i
            if sq == stones || !dp.call(player ^ 1, stones - sq)
                memo[key] = true
                return true
            end
        end
        memo[key] = false
        false
    end
    dp.call(0, n)
end
