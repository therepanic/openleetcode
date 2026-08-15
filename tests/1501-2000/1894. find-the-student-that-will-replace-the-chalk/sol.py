class Solution:
    def chalkReplacer(self, chalk, k):
        total = sum(chalk)
        k %= total
        for i, amount in enumerate(chalk):
            if k < amount:
                return i
            k -= amount
