# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_range_sum(nums, lower, upper)
    psum = [0]
    nums.each do |num|
        psum << (psum[-1] + num)
    end

    slist = []
    result = 0
    psum.reverse.each do |pval|
        left = slist.bsearch_index { |x| x >= pval + lower } || slist.length
        right = slist.bsearch_index { |x| x > pval + upper } || slist.length
        result += right - left

        idx = slist.bsearch_index { |x| x >= pval } || slist.length
        slist.insert(idx, pval)
    end

    result
end
