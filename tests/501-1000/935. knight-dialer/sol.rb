# @param {Integer} n
# @return {Integer}
def knight_dialer(n)
    return 10 if n == 1
    
    dp = [1] * 10
    mapping = {
        0 => [4, 6],
        1 => [6, 8],
        2 => [7, 9],
        3 => [4, 8],
        4 => [0, 3, 9],
        5 => [],
        6 => [0, 1, 7],
        7 => [2, 6],
        8 => [1, 3],
        9 => [2, 4]
    }
    
    (n - 1).times do
        new_arr = [0] * 10
        (0..9).each do |i|
            mapping[i].each do |digit|
                new_arr[digit] += dp[i]
            end
        end
        dp = new_arr
    end
    
    dp.sum % (10**9 + 7)
end
