class Solution(object):
    def maximizeXor(self, nums, queries):
        child_zero = [-1]
        child_one = [-1]

        def insert(num):
            node = 0
            for i in range(30, -1, -1):
                bit = (num >> i) & 1
                children = child_one if bit else child_zero
                if children[node] == -1:
                    children[node] = len(child_zero)
                    child_zero.append(-1)
                    child_one.append(-1)
                node = children[node]

        def maxor(num):
            if child_zero[0] == -1 and child_one[0] == -1:
                return -1
            node = 0
            ans = 0
            for i in range(30, -1, -1):
                bit = (num >> i) & 1
                opp = 1 - bit
                opposite = child_one if opp else child_zero
                if opposite[node] != -1:
                    ans |= 1 << i
                    node = opposite[node]
                else:
                    node = (child_one if bit else child_zero)[node]
            return ans

        nums.sort()
        q = []
        for i, (x, m) in enumerate(queries):
            q.append((m, x, i))

        q.sort()
        res = [-1] * len(queries)
        idx = 0
        n = len(nums)
        for m, x, i in q:
            while idx < n and nums[idx] <= m:
                insert(nums[idx])
                idx += 1
            res[i] = maxor(x)
        return res
