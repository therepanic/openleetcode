# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_moves(nums, k)
    idx = []
    nums.each_with_index do |val, i|
        idx << i if val == 1
    end
    a = []
    idx.each_with_index do |val, i|
        a << val - i
    end
    n = idx.length
    prefix = [0] * n
    if n > 0
        prefix[0] = a[0]
        (1...n).each do |i|
            prefix[i] = prefix[i-1] + a[i]
        end
    end
    cost = lambda do |l, r|
        mid = (l + r) / 2
        med = a[mid]
        left_sum = prefix[mid] - (l > 0 ? prefix[l-1] : 0)
        right_sum = prefix[r] - prefix[mid]
        (med * (mid - l + 1) - left_sum) + (right_sum - med * (r - mid))
    end
    ans = Float::INFINITY
    l = 0
    (0...n).each do |r|
        while r - l + 1 > k
            l += 1
        end
        if r - l + 1 == k
            ans = [ans, cost.call(l, r)].min
        end
    end
    ans.to_i
end
