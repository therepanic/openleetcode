class Solution:
    def minDistance(self, word1, word2):
        cache = {}

        def dp(i, j):
            if (i, j) in cache:
                return cache[(i, j)]

            if i == 0:
                return j
            if j == 0:
                return i

            if word1[i - 1] == word2[j - 1]:
                res = dp(i - 1, j - 1)
            else:
                res = 1 + min(
                    dp(i - 1, j),  # Delete
                    dp(i, j - 1),  # Insert
                    dp(i - 1, j - 1),  # Replace
                )

            cache[(i, j)] = res
            return res

        return dp(len(word1), len(word2))
