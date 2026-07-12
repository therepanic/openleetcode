# @param {Integer[]} nums
# @return {Integer[]}
def sort_array(nums)
    merge = lambda do |nums, l, mid, r|
        a = []
        b = []
        (l..mid).each { |i| a << nums[i] }
        (mid + 1..r).each { |j| b << nums[j] }
        i = 0
        j = 0
        k = l
        while k <= r
            if j == b.length
                nums[k] = a[i]
                i += 1
            elsif i == a.length
                nums[k] = b[j]
                j += 1
            elsif a[i] <= b[j]
                nums[k] = a[i]
                i += 1
            else
                nums[k] = b[j]
                j += 1
            end
            k += 1
        end
    end

    mergesort = lambda do |nums, l, r|
        return if l >= r
        mid = (l + r) / 2
        mergesort.call(nums, l, mid)
        mergesort.call(nums, mid + 1, r)
        merge.call(nums, l, mid, r)
    end

    mergesort.call(nums, 0, nums.length - 1)
    nums
end
