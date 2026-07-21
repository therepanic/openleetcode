class Solution(object):
    def maxScore(self, s):
        totalOnes = s.count("1")  # Count total ones
        zerosCount = 0
        onesCount = 0
        bestScore = float("-inf")

        # Traverse the string and calculate scores
        for i in range(len(s) - 1):  # Stop before the last character
            if s[i] == "0":
                zerosCount += 1
            else:
                onesCount += 1

            # Calculate score
            currentScore = zerosCount + (totalOnes - onesCount)
            bestScore = max(bestScore, currentScore)

        return bestScore
