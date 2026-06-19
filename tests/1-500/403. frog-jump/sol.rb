# @param {Integer[]} stones
# @return {Boolean}
def can_cross(stones)
    dp = {}
    stones.each { |stone| dp[stone] = Set.new }
    dp[0] = Set.new([0])

    stones.each do |stone|
        dp[stone].each do |jump|
            [jump - 1, jump, jump + 1].each do |jump_distance|
                if jump_distance > 0 && dp.key?(stone + jump_distance)
                    dp[stone + jump_distance].add(jump_distance)
                end
            end
        end
    end

    !dp[stones[-1]].empty?
end
