# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        # helper dfs returns count of good nodes from this node down
        def dfs(node, max_so_far):
            if not node:
                return 0  # base case: null node, 0 good nodes

            # is this node good?
            count = 1 if node.val >= max_so_far else 0

            # update max for children
            new_max = max(max_so_far, node.val)

            # count good nodes in left and right subtrees
            count += dfs(node.left, new_max)
            count += dfs(node.right, new_max)

            return count

        return dfs(root, root.val)
