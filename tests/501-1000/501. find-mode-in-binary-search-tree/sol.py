from collections import Counter


class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:

        lst = []
        curr = root

        def traverse(curr):
            if curr:
                lst.append(curr.val)
                traverse(curr.left)
                traverse(curr.right)

        traverse(curr)

        d = Counter(lst)
        m = 0
        for i in lst:
            m = max(m, d[i])
        sol = []
        for i in lst:
            if d[i] == m:
                sol.append(i)
        return list(set(sol))
