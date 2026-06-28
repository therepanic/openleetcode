# @param {Integer} n
# @return {Integer}
def rotated_digits(n)
    dp = Array.new(n + 1, 0)
    count = 0

    (0..n).each do |i|
        if i < 10
            if [0, 1, 8].include?(i)
                dp[i] = 1
            elsif [2, 5, 6, 9].include?(i)
                dp[i] = 2
                count += 1
            else
                dp[i] = 0
            end
        else
            a = dp[i / 10]
            b = dp[i % 10]

            if a == 1 && b == 1
                dp[i] = 1
            elsif a >= 1 && b >= 1
                dp[i] = 2
                count += 1
            else
                dp[i] = 0
            end
        end
    end

    count
end
