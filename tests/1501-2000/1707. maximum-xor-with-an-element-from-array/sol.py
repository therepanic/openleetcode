class Solution(object):
    def maximizeXor(self, nums, queries):
        trie = [[-1, -1]]

        def insert(num):
            node = 0
            for i in range(31, -1, -1):
                bit = (num >> i) & 1
                if trie[node][bit] == -1:
                    trie[node][bit] = len(trie)
                    trie.append([-1, -1])
                node = trie[node][bit]

        def maxor(num):
            if trie[0][0] == -1 and trie[0][1] == -1:
                return -1
            node = 0
            ans = 0
            for i in range(31, -1, -1):
                bit = (num >> i) & 1
                opp = 1 - bit
                if trie[node][opp] != -1:
                    ans |= 1 << i
                    node = trie[node][opp]
                else:
                    node = trie[node][bit]
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

        """
        :type nums: List[int]
        :type queries: List[List[int]]
        :rtype: List[int]
        """
