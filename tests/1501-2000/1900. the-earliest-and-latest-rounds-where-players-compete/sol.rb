# @param {Integer} n
# @param {Integer} first_player
# @param {Integer} second_player
# @return {Integer[]}
def earliest_and_latest(n, first_player, second_player)
    dfs = lambda do |n, p1, p2|
        return [1, 1] if p1 + p2 == n + 1
        if p1 > p2
            p1, p2 = p2, p1
        end
        return [2, 2] if n <= 4
        
        m = (n + 1) / 2
        min_r, max_r = Float::INFINITY, -Float::INFINITY
        
        if p1 - 1 > n - p2
            t = n + 1 - p1
            p1 = n + 1 - p2
            p2 = t
        end
        
        if p2 * 2 <= n + 1
            a = p1 - 1
            b = p2 - p1 - 1
            (0..a).each do |i|
                (0..b).each do |j|
                    r1, r2 = dfs.call(m, i + 1, i + j + 2)
                    min_r = [min_r, r1 + 1].min
                    max_r = [max_r, r2 + 1].max
                end
            end
        else
            p4 = n + 1 - p2
            a = p1 - 1
            b = p4 - p1 - 1
            c = p2 - p4 - 1
            (0..a).each do |i|
                (0..b).each do |j|
                    offset = i + j + 1 + (c + 1) / 2 + 1
                    r1, r2 = dfs.call(m, i + 1, offset)
                    min_r = [min_r, r1 + 1].min
                    max_r = [max_r, r2 + 1].max
                end
            end
        end
        
        [min_r, max_r]
    end
    
    dfs.call(n, first_player, second_player)
end
