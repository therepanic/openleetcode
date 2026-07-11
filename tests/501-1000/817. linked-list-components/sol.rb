# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer[]} nums
# @return {Integer}
def num_components(head, nums)
    node_set = nums.to_set
    count = 0
    in_component = false
    while head
        if node_set.include?(head.val)
            if !in_component
                count += 1
                in_component = true
            end
        else
            in_component = false
        end
        head = head.next
    end
    count
end
