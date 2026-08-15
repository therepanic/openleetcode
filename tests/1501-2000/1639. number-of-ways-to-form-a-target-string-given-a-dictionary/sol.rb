# @param {String[]} words
# @param {String} target
# @return {Integer}
def num_ways(words, target)
    words = words.scan(/[a-z]+/) if words.is_a?(String)
    mod = 10**9 + 7
    m = words[0].length
    counts = Array.new(m) { Array.new(26, 0) }
    words.each do |word|
        word.chars.each_with_index do |ch, j|
            counts[j][ch.ord - 'a'.ord] += 1
        end
    end
    dp = Array.new(m) { Array.new(target.length, -1) }

    solve = ->(i, j) {
        return 1 if j == target.length
        return 0 if i == m
        return dp[i][j] if dp[i][j] != -1

        count = solve.call(i+1, j) % mod
        count = (count + counts[i][target[j].ord - 'a'.ord] * solve.call(i+1, j+1)) % mod
        dp[i][j] = count
        count
    }
    solve.call(0, 0)
end
