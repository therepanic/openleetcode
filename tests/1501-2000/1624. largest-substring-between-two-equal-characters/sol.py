class Solution:
    def maxLengthBetweenEqualCharacters(self, s):
        firstPos = [-1] * 26
        lastPos = [-1] * 26
        n = len(s)
        for i in range(n):
            idx = ord(s[i]) - ord("a")
            if firstPos[idx] == -1:
                firstPos[idx] = i
        for i in range(n - 1, -1, -1):
            idx = ord(s[i]) - ord("a")
            if lastPos[idx] == -1:
                lastPos[idx] = i
        maxLenSubStr = -1
        for i in range(26):
            if firstPos[i] != -1 and lastPos[i] != -1:
                maxLenSubStr = max(maxLenSubStr, lastPos[i] - firstPos[i] - 1)
        return maxLenSubStr


# Example
print(Solution().maxLengthBetweenEqualCharacters("abca"))  # Output: 2
