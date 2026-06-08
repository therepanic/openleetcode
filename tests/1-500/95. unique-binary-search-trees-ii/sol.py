# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution(object):
    def generateTrees(self, n):
        if n == 0:
            return []

        memo = {}

        def build(start, end):
            if start > end:
                return [None]

            key = (start, end)
            if key in memo:
                return memo[key]

            all_trees = []
            for i in range(start, end + 1):
                left_trees = build(start, i - 1)
                right_trees = build(i + 1, end)
                for l in left_trees:
                    for r in right_trees:
                        root = TreeNode(i)
                        root.left = l
                        root.right = r
                        all_trees.append(root)

            memo[key] = all_trees
            return all_trees

        return build(1, n)
