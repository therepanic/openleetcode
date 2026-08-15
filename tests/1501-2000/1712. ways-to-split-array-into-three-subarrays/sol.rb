# @param {Integer[]} nums
# @return {Integer}
def ways_to_split(nums)
    mod = 10**9 + 7
    n = nums.length
    prefix = Array.new(n)
    prefix[0] = nums[0]
    
    (1...n).each do |i|
        prefix[i] = prefix[i - 1] + nums[i]
    end
    
    res = 0
    (0...(n - 2)).each do |i|
        left = prefix[i]
        j = lower_bound(prefix, 2 * left, i + 1, n - 1)
        k = upper_bound(prefix, (prefix[-1] + left) / 2, j, n - 1)
        res = (res + [k - j, 0].max) % mod if j < k
    end
    res
end

def lower_bound(arr, target, lo, hi)
    while lo < hi
        mid = (lo + hi) / 2
        if arr[mid] < target
            lo = mid + 1
        else
            hi = mid
        end
    end
    lo
end

def upper_bound(arr, target, lo, hi)
    while lo < hi
        mid = (lo + hi) / 2
        if arr[mid] <= target
            lo = mid + 1
        else
            hi = mid
        end
    end
    lo
end
