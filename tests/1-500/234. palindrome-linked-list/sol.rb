# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
    slow = head
    fast = head
    
    # Step 1
    while fast && fast.next
        fast = fast.next.next
        slow = slow.next
    end
    
    # Step 2
    node = nil
    while slow
        temp = slow.next
        slow.next = node
        node = slow
        slow = temp
    end
    
    # Step 3
    first = head
    second = node
    while second
        if first.val != second.val
            return false
        end
        first = first.next
        second = second.next
    end
    
    return true
end
