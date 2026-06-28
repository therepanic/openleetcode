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
# @return {ListNode[]}
def split_list_to_parts(head, k)
    # Step 1: Calculate the length of the linked list
    length = 0
    current = head
    while current
        length += 1
        current = current.next
    end
    
    # Step 2: Determine the size of each part
    part_size = length / k
    larger_parts = length % k
    
    # Initialize a list to store the results
    result = []
    
    # Step 3: Split the linked list into parts
    current = head
    k.times do |i|
        sublist_size = i < larger_parts ? part_size + 1 : part_size
        if sublist_size == 0
            result << nil
        else
            sublist_head = current
            (sublist_size - 1).times do
                current = current.next
            end
            next_node = current.next
            current.next = nil
            result << sublist_head
            current = next_node
        end
    end
    
    result
end
