# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
    stones.map! { |stone| -stone }
    
    stones = stones.sort.reverse
    
    while stones.length > 1
        max_stone1 = stones.pop
        max_stone2 = stones.pop
        
        if max_stone1 != max_stone2
            diff = max_stone1 - max_stone2
            index = stones.bsearch_index { |x| x <= diff } || stones.length
            stones.insert(index, diff)
        end
    end
    
    stones.empty? ? 0 : -stones[0]
end
