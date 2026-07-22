# @param {Integer[]} piles
# @return {Integer}
def stone_game_ii(piles)
    n = piles.length
    suffix = Array.new(n + 1, 0)
    (n - 1).downto(0) do |i|
        suffix[i] = suffix[i + 1] + piles[i]
    end
    memo = {}

    best = lambda do |i, m|
        return 0 if i >= n
        key = [i, m]
        return memo[key] if memo.key?(key)
        answer = 0
        (1..[2 * m, n - i].min).each do |x|
            answer = [answer, suffix[i] - best.call(i + x, [m, x].max)].max
        end
        memo[key] = answer
        answer
    end

    best.call(0, 1)
end
