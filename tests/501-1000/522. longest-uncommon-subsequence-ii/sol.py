class Solution(object):
    def findLUSlength(self, strs):
        def is_subsequence(s, t):
            it = iter(t)
            return all(c in it for c in s)

        strs.sort(key=lambda x: -len(x))

        for i, s in enumerate(strs):
            if all(not is_subsequence(s, strs[j]) for j in range(len(strs)) if j != i):
                return len(s)

        return -1
