# @param {String} word
# @return {Integer}
def minimum_distance(word)
    n = word.length
    dp = Array.new(26, 0)
    ndp = Array.new(26, 0)

    (1...n).each do |i|
        p = word[i - 1].ord - 'A'.ord
        t = word[i].ord - 'A'.ord

        (0...26).each { |j| ndp[j] = dp[j] + (p / 6 - t / 6).abs + ((p % 6) - (t % 6)).abs }

        (0...26).each do |j|
            ndp[p] = [ndp[p], dp[j] + (j / 6 - t / 6).abs + ((j % 6) - (t % 6)).abs].min
        end

        dp, ndp = ndp, dp
    end

    dp.min
end
