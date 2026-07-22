# @param {Integer[]} houses
# @param {Integer[][]} cost
# @param {Integer} m
# @param {Integer} n
# @param {Integer} target
# @return {Integer}
def min_cost(houses, cost, m, n, target)
    inf = Float::INFINITY
    prev = Array.new(n) { Array.new(target + 1, inf) }
    if houses[0] != 0
        c = houses[0] - 1
        prev[c][1] = 0
    else
        (0...n).each do |c|
            prev[c][1] = cost[0][c]
        end
    end
    (1...m).each do |i|
        curr = Array.new(n) { Array.new(target + 1, inf) }
        if houses[i] != 0
            c = houses[i] - 1
            add = 0
            (1..target).each do |k|
                if prev[c][k] < inf
                    if prev[c][k] + add < curr[c][k]
                        curr[c][k] = prev[c][k] + add
                    end
                end
                if k > 1
                    best = inf
                    (0...n).each do |pc|
                        if pc != c && prev[pc][k - 1] < best
                            best = prev[pc][k - 1]
                        end
                    end
                    if best < inf && best + add < curr[c][k]
                        curr[c][k] = best + add
                    end
                end
            end
        else
            (0...n).each do |c|
                add = cost[i][c]
                (1..target).each do |k|
                    if prev[c][k] < inf
                        if prev[c][k] + add < curr[c][k]
                            curr[c][k] = prev[c][k] + add
                        end
                    end
                    if k > 1
                        best = inf
                        (0...n).each do |pc|
                            if pc != c && prev[pc][k - 1] < best
                                best = prev[pc][k - 1]
                            end
                        end
                        if best < inf && best + add < curr[c][k]
                            curr[c][k] = best + add
                        end
                    end
                end
            end
        end
        prev = curr
    end
    ans = prev.map { |row| row[target] }.min
    ans >= inf ? -1 : ans
end
