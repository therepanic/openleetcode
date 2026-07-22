# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def remove_zero_sum_sublists(head)
    dummy = ListNode.new(0)
    dummy.next = head
    prefix_sum = 0
    seen = {}

    curr = dummy
    while curr
        prefix_sum += curr.val
        seen[prefix_sum] = curr
        curr = curr.next
    end

    prefix_sum = 0
    curr = dummy
    while curr
        prefix_sum += curr.val
        curr.next = seen[prefix_sum].next
        curr = curr.next
    end

    dummy.next
end
