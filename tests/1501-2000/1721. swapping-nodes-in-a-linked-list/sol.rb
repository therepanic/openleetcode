# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def swap_nodes(head, k)
    return head if head.nil? || head.next.nil?

    temp = head
    first_prev = nil

    n = 1
    while n < k
        first_prev = temp
        temp = temp.next
        n += 1
    end

    first = temp

    second = head
    second_prev = nil
    temp = first
    while temp.next
        second_prev = second
        temp = temp.next
        second = second.next
    end

    first_prev.next = second if first_prev
    second_prev.next = first if second_prev

    temp = first.next
    first.next = second.next
    second.next = temp

    return second if k == 1
    return first if second == head

    head
end
