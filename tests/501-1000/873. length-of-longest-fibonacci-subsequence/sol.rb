# @param {Integer[]} arr
# @return {Integer}
def len_longest_fib_subseq(arr)
    n = arr.length
    dp = Array.new(n) { Array.new(n, 0) }
    max_len = 0
    
    (2...n).each do |curr|
        start = 0
        end_idx = curr - 1
        
        while start < end_idx
            pair_sum = arr[start] + arr[end_idx]
            
            if pair_sum > arr[curr]
                end_idx -= 1
            elsif pair_sum < arr[curr]
                start += 1
            else
                dp[end_idx][curr] = dp[start][end_idx] + 1
                max_len = [dp[end_idx][curr], max_len].max
                end_idx -= 1
                start += 1
            end
        end
    end
    
    max_len > 0 ? max_len + 2 : 0
end
