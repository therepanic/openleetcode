# @param {String} s
# @param {Integer} k
# @return {Integer}
def get_length_of_optimal_compression(s, k)
    n = s.length
    dp = Array.new(110) { Array.new(110, 9999) }
    dp[0][0] = 0

    (1..n).each do |i|
        (0..k).each do |j|
            cnt = 0
            del = 0
            i.downto(1) do |l|
                if s[l - 1] == s[i - 1]
                    cnt += 1
                else
                    del += 1
                end

                if j - del >= 0
                    add = if cnt >= 100
                        3
                    elsif cnt >= 10
                        2
                    elsif cnt >= 2
                        1
                    else
                        0
                    end
                    dp[i][j] = [dp[i][j], dp[l - 1][j - del] + 1 + add].min
                end
            end

            if j > 0
                dp[i][j] = [dp[i][j], dp[i - 1][j - 1]].min
            end
        end
    end

    dp[n][k]
end
