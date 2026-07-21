# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pseudoPalindromicPaths(self, root: Optional[TreeNode]) -> int:
        def check_palindromic(num):
            odd = 0
            for i in range(1, 10):
                if counter[i] % 2 == 1:
                    odd += 1
                    if odd > 1:
                        return False
            return True

        def dfs(root, counter):
            nonlocal count
            if not root:
                return

            counter[root.val] += 1

            if not root.left and not root.right:
                if check_palindromic(counter):
                    count += 1

            else:
                dfs(root.left, counter)
                dfs(root.right, counter)

            counter[root.val] -= 1

        count = 0
        counter = [0] * 10
        dfs(root, counter)

        return count
