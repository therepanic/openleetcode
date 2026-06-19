# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    s1 = ''
    while l1
        s1 += l1.val.to_s
        l1 = l1.next
    end

    s2 = ''
    while l2
        s2 += l2.val.to_s
        l2 = l2.next
    end

    r = (s1.to_i + s2.to_i).to_s
    dummy = ListNode.new(0)
    cur = dummy

    r.each_char do |x|
        cur.next = ListNode.new(x.to_i)
        cur = cur.next
    end

    dummy.next
end
