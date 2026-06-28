# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findDuplicateSubtrees(
        self, root: Optional[TreeNode]
    ) -> List[Optional[TreeNode]]:
        seen = {}
        self.ans = []

        def solve(node):
            if not node:
                return "#"

            left = solve(node.left)
            right = solve(node.right)

            curr_tree = f"{node.val}, {left}, {right}"

            if curr_tree not in seen:
                seen[curr_tree] = 0
            seen[curr_tree] += 1

            if seen[curr_tree] == 2:
                self.ans.append(node)

            return curr_tree

        solve(root)
        return self.ans
