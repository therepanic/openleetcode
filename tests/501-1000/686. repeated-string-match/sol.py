class Solution:
    def repeatedStringMatch(self, a: str, b: str) -> int:
        repeatA = a
        count = 1

        while len(repeatA) < len(b):
            repeatA += a
            count += 1
            if b in repeatA:
                return count

        # One more repetition to check if b is fully contained
        repeatA += a
        count += 1
        if b in repeatA:
            return count

        return -1
