# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def k_concatenation_max_sum(arr, k)
    mod = 10**9 + 7
    kadanes = ->(nums) {
        best = 0
        total = 0
        nums.each do |x|
            total += x
            total = 0 if total < 0
            best = [best, total].max
        end
        best
    }
    
    if k <= 3
        return kadanes.call(arr * k) % mod
    end
    
    s = [0, (arr.sum * (k-1))].max % mod
    [s + kadanes.call(arr), kadanes.call(arr * 2)].max % mod
end
