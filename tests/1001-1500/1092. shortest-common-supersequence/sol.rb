# @param {String} str1
# @param {String} str2
# @return {String}
def shortest_common_supersequence(str1, str2)
    m, n = str1.length, str2.length
    dp = Array.new(m + 1) { Array.new(n + 1, 0) }
    
    (1..m).each do |i|
        (1..n).each do |j|
            if str1[i-1] == str2[j-1]
                dp[i][j] = 1 + dp[i-1][j-1]
            else
                dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
            end
        end
    end
    
    i, j = m, n
    result = []
    
    while i > 0 && j > 0
        if str1[i-1] == str2[j-1]
            result << str1[i-1]
            i -= 1
            j -= 1
        elsif dp[i-1][j] > dp[i][j-1]
            result << str1[i-1]
            i -= 1
        else
            result << str2[j-1]
            j -= 1
        end
    end
    
    while i > 0
        result << str1[i-1]
        i -= 1
    end
    
    while j > 0
        result << str2[j-1]
        j -= 1
    end
    
    result.reverse.join
end
