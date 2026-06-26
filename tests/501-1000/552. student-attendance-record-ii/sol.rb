# @param {Integer} n
# @return {Integer}
def check_record(n)
    mod = 1000000007
    dp = [[0, 0, 0], [0, 0, 0]]
    dp[0][0] = 1

    n.times do
        ndp = [[0, 0, 0], [0, 0, 0]]
        (0...2).each do |absences|
            (0...3).each do |lates|
                cur = dp[absences][lates]
                next if cur == 0
                ndp[absences][0] = (ndp[absences][0] + cur) % mod
                if absences == 0
                    ndp[1][0] = (ndp[1][0] + cur) % mod
                end
                if lates < 2
                    ndp[absences][lates + 1] = (ndp[absences][lates + 1] + cur) % mod
                end
            end
        end
        dp = ndp
    end

    total = 0
    dp.each do |row|
        row.each do |value|
            total = (total + value) % mod
        end
    end
    total
end
