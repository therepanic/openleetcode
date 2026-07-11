from typing import Optional


class Solution:
    def recoverFromPreorder(self, traversal: str) -> Optional[TreeNode]:
        stack = []
        i = 0
        n = len(traversal)
        while i < n:
            depth = 0
            while i < n and traversal[i] == "-":
                depth += 1
                i += 1
            val = 0
            while i < n and traversal[i].isdigit():
                val = val * 10 + ord(traversal[i]) - 48
                i += 1
            node = TreeNode(val)
            while len(stack) > depth:
                stack.pop()
            if stack:
                parent = stack[-1]
                if parent.left is None:
                    parent.left = node
                else:
                    parent.right = node
            stack.append(node)
        return stack[0] if stack else None
