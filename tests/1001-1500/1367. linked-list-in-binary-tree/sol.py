# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSubPath(self, head: Optional[ListNode], root: Optional[TreeNode]) -> bool:
        def matches(node, current):
            if current is None:
                return True
            if node is None or node.val != current.val:
                return False
            return matches(node.left, current.next) or matches(node.right, current.next)

        if root is None:
            return False
        return (
            matches(root, head)
            or self.isSubPath(head, root.left)
            or self.isSubPath(head, root.right)
        )
