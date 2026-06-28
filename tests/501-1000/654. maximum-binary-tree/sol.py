# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def constructMaximumBinaryTree(self, nums):
        stack = []

        for num in nums:
            current = TreeNode(num)

            # Pop smaller elements and make them left child
            while stack and stack[-1].val < num:
                current.left = stack.pop()

            # The last bigger element in stack becomes parent (right child link)
            if stack:
                stack[-1].right = current

            stack.append(current)

        # The root is at the bottom of the stack
        return stack[0]
