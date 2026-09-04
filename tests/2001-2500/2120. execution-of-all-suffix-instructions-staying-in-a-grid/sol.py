class Solution:
    def executeInstructions(self, n, startPos, s):
        m = len(s)
        ans = []
        for i in range(m):
            row, col = startPos
            count = 0
            for j in range(i, m):
                if s[j] == 'L':
                    col -= 1
                elif s[j] == 'R':
                    col += 1
                elif s[j] == 'U':
                    row -= 1
                else:
                    row += 1
                if 0 <= row < n and 0 <= col < n:
                    count += 1
                else:
                    break
            ans.append(count)
        return ans