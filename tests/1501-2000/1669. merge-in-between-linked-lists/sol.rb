# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} list1
# @param {Integer} a
# @param {Integer} b
# @param {ListNode} list2
# @return {ListNode}
def merge_in_between(list1, a, b, list2)
    curr = list1
    (a-1).times { curr = curr.next }
    prev = curr
    (b-a+2).times { curr = curr.next }
    prev.next = list2
    prev = prev.next
    while prev.next
        prev = prev.next
    end
    prev.next = curr
    list1
end
