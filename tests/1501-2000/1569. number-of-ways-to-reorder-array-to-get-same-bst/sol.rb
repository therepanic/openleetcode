# @param {Integer[]} nums
# @return {Integer}
def num_of_ways(nums)
    mod = 1000000007
    n = nums.length
    
    ncr = Array.new(n+1) { Array.new(n+1, 0) }
    (0..n).each do |i|
        ncr[i][0] = ncr[i][i] = 1
        (1...i).each do |j|
            ncr[i][j] = (ncr[i-1][j-1] + ncr[i-1][j]) % mod
        end
    end
    
    dfs = lambda do |arr|
        return 1 if arr.length <= 2
        root = arr[0]
        left = arr[1..].select { |x| x < root }
        right = arr[1..].select { |x| x > root }
        left_ways = dfs.call(left)
        right_ways = dfs.call(right)
        l, r = left.length, right.length
        (ncr[l+r][l] * left_ways % mod * right_ways) % mod
    end
    
    (dfs.call(nums) - 1) % mod
end
