# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def number_of_sets(n, k)
    mod = 10**9 + 7
    dp_prev = Array.new(n, 1)
    
    prefix_prev = Array.new(n, 0)
    prefix_prev[0] = dp_prev[0]
    (1...n).each do |i|
        prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % mod
    end
    
    (1..k).each do
        dp_cur = Array.new(n, 0)
        (1...n).each do |i|
            dp_cur[i] = dp_cur[i-1] + prefix_prev[i-1]
            dp_cur[i] %= mod if dp_cur[i] >= mod
        end
        
        dp_prev = dp_cur
        prefix_prev[0] = dp_prev[0]
        (1...n).each do |i|
            prefix_prev[i] = (prefix_prev[i-1] + dp_prev[i]) % mod
        end
    end
    
    dp_prev[n-1]
end
