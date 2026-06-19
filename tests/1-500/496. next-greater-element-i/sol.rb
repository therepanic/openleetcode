# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
    next_greater = {}
    stack = []
    
    nums2.reverse_each do |num|
        while !stack.empty? && stack.last <= num
            stack.pop
        end
        next_greater[num] = stack.empty? ? -1 : stack.last
        stack.push(num)
    end
    
    nums1.map { |num| next_greater[num] }
end
