# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @param {TreeNode} root
# @return {Boolean}
def is_sub_path(head, root)
    def matches(node, current)
        return true if current.nil?
        return false if node.nil? || node.val != current.val
        return matches(node.left, current.next) || matches(node.right, current.next)
    end
    
    return false if root.nil?
    return matches(root, head) || is_sub_path(head, root.left) || is_sub_path(head, root.right)
end
