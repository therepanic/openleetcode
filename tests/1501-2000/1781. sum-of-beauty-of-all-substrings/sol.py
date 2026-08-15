class Solution:
    def beautySum(self, s: str) -> int:
        n = len(s)
        sumOfBeauty = 0

        for i in range(n):
            freq = [0] * 26

            for j in range(i, n):
                freq[ord(s[j]) - 97] += 1

                maxi = float("-inf")
                mini = float("inf")

                for diff in freq:
                    if diff > 0:
                        maxi = max(maxi, diff)
                        mini = min(mini, diff)

                sumOfBeauty += maxi - mini

        return sumOfBeauty
