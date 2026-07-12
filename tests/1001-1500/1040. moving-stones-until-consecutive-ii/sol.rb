# @param {Integer[]} stones
# @return {Integer[]}
def num_moves_stones_ii(stones)
    stones.sort!
    n = stones.length
    
    max_moves = [stones[-1] - stones[1] - (n - 2), stones[-2] - stones[0] - (n - 2)].max
    
    min_moves = n
    left = 0
    (0...n).each do |right|
        while stones[right] - stones[left] + 1 > n
            left += 1
        end
        current_window_size = right - left + 1
        if current_window_size == n - 1 && stones[right] - stones[left] + 1 == n - 1
            min_moves = [min_moves, 2].min
        else
            min_moves = [min_moves, n - current_window_size].min
        end
    end
    
    [min_moves, max_moves]
end
