# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}
def max_number(nums1, nums2, k)
    get_deq = ->(nums, q) {
        stack = []
        if q > 0
            max_drop = nums.length - q
            nums.each do |num|
                while max_drop > 0 && !stack.empty? && stack[-1] < num
                    stack.pop
                    max_drop -= 1
                end
                stack.push(num)
            end
        end
        stack[0...q]
    }

    merge = ->(a, b) {
        output = []
        i = j = 0
        while i < a.length || j < b.length
            if (a[i..-1] <=> b[j..-1]) == 1
                output.push(a[i])
                i += 1
            else
                output.push(b[j])
                j += 1
            end
        end
        output
    }

    ans = []
    m, n = nums1.length, nums2.length
    start = [0, k - n].max
    end_val = [m, k].min
    (start..end_val).each do |i|
        dq1 = get_deq.call(nums1, i)
        dq2 = get_deq.call(nums2, k - i)
        candidate = merge.call(dq1, dq2)
        ans = candidate if (candidate <=> ans) == 1
    end
    ans
end
