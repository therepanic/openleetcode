# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
from typing import Optional


class Solution:
    def smallestFromLeaf(self, root: Optional[TreeNode]) -> str:
        smallest_string = ""
        node_queue = deque()

        # Add root node to deque along with its value converted to a character
        node_queue.append([root, chr(root.val + ord("a"))])

        # Perform BFS traversal until deque is empty
        while node_queue:
            # Pop the leftmost node and its corresponding string from deque
            node, current_string = node_queue.popleft()

            # If current node is a leaf node
            if not node.left and not node.right:
                # Update smallest_string if it's empty or current string is smaller
                smallest_string = (
                    min(smallest_string, current_string)
                    if smallest_string
                    else current_string
                )

            # If current node has a left child, append it to deque
            if node.left:
                node_queue.append(
                    [node.left, chr(node.left.val + ord("a")) + current_string]
                )

            # If current node has a right child, append it to deque
            if node.right:
                node_queue.append(
                    [node.right, chr(node.right.val + ord("a")) + current_string]
                )

        return smallest_string
