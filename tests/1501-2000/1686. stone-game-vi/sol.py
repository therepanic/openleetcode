class Solution:
    """My Greedy Solution!!!"""

    def stoneGameVI(self, aliceValues: list[int], bobValues: list[int]) -> int:
        n = len(aliceValues)
        combined = [
            (aliceValues[i] + bobValues[i], aliceValues[i], bobValues[i])
            for i in range(n)
        ]
        combined.sort(key=lambda x: x[0], reverse=True)

        alice = bob = 0
        for i, (total, a_val, b_val) in enumerate(combined):
            if i % 2 == 0:
                alice += a_val
            else:
                bob += b_val

        if alice > bob:
            return 1
        elif alice < bob:
            return -1
        else:
            return 0
