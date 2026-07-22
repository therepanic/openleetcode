# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
    m, n = text1.length, text2.length
    memo = Array.new(m) { Array.new(n, -1) }

    solve = lambda do |i, j|
        return 0 if i >= m || j >= n
        return memo[i][j] if memo[i][j] != -1

        if text1[i] == text2[j]
            memo[i][j] = 1 + solve.call(i + 1, j + 1)
        else
            memo[i][j] = [solve.call(i + 1, j), solve.call(i, j + 1)].max
        end
        memo[i][j]
    end

    solve.call(0, 0)
end
