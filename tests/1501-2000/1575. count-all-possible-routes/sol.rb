# @param {Integer[]} locations
# @param {Integer} start
# @param {Integer} finish
# @param {Integer} fuel
# @return {Integer}
def count_routes(locations, start, finish, fuel)
    mod = 1000000007
    n = locations.length
    dp = Array.new(n) { Array.new(fuel + 1, 0) }
    (0...n).each do |city|
        dp[city][0] = (city == finish) ? 1 : 0
    end
    (1..fuel).each do |left|
        (0...n).each do |city|
            total = (city == finish) ? 1 : 0
            (0...n).each do |nxt|
                if nxt != city
                    cost = (locations[nxt] - locations[city]).abs
                    if cost <= left
                        total = (total + dp[nxt][left - cost]) % mod
                    end
                end
            end
            dp[city][left] = total
        end
    end
    dp[start][fuel]
end
