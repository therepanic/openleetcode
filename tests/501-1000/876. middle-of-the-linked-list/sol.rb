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
def middle_node(head)
  return head if head.nil? || head.next.nil?
  slow, fast = head, head
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end
  slow
end
