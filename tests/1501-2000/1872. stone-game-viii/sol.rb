# @param {Integer[]} stones
# @return {Integer}
def stone_game_viii(stones)
    n = stones.length
    (1...n).each { |i| stones[i] += stones[i-1] }
    
    best = stones[-1]
    (n - 2).downto(1) { |i| best = [best, stones[i] - best].max }
    best
end
