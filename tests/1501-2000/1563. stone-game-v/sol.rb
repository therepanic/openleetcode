# @param {Integer[]} stone_value
# @return {Integer}
def stone_game_v(stone_value)
    sv = [0] + stone_value.reduce([]) { |acc, x| acc << (acc.empty? ? x : acc.last + x) }
    memo = {}
    
    helper = lambda do |fro, to|
        return 0 if to - fro == 1
        key = [fro, to]
        return memo[key] if memo.key?(key)
        
        mid = sv.bsearch_index { |x| x >= (sv[to] + sv[fro]) / 2.0 } || to
        mid = [mid, to].min
        
        dist = 0
        res = 0
        explore_more = true
        while explore_more
            explore_more = false
            [mid - dist, mid + dist].each do |i|
                if fro < i && i <= to
                    left = sv[i] - sv[fro]
                    right = sv[to] - sv[i]
                    if res / 2 <= left && left <= right
                        res = [res, left + helper.call(fro, i)].max
                        explore_more = true
                    end
                    if left >= right && right >= res / 2
                        res = [res, right + helper.call(i, to)].max
                        explore_more = true
                    end
                end
            end
            dist += 1
        end
        memo[key] = res
        res
    end
    
    helper.call(0, stone_value.length)
end
