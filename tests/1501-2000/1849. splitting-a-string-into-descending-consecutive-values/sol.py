class Solution(object):
    def splitString(self, s):
        """
        :type s: str
        :rtype: bool
        """

        def dfs(index, prev):
            if index == len(s):
                return True

            curr = 0
            for i in range(index, len(s)):
                curr = curr * 10 + int(s[i])
                if prev - curr == 1:
                    if dfs(i + 1, curr):
                        return True
                elif curr >= prev:
                    break
            return False

        for i in range(len(s) - 1):
            first = int(s[: i + 1])
            if dfs(i + 1, first):
                return True
        return False
