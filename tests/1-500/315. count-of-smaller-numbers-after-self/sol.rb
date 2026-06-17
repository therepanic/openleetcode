# @param {Integer[]} nums
# @return {Integer[]}
def count_smaller(nums)
    sorted_list = []
    ans = []
    nums.reverse_each do |n|
        idx = sorted_list.bsearch_index { |x| x >= n } || sorted_list.size
        ans << idx
        sorted_list.insert(idx, n)
    end
    ans.reverse
end
