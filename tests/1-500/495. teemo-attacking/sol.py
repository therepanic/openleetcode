class Solution:
    def findPoisonedDuration(self, timeSeries: List[int], duration: int) -> int:
        totalSecs = 0
        prev = None

        for t in timeSeries:
            totalSecs += duration

            if prev is not None and prev + duration > t:
                totalSecs -= prev + duration - t

            prev = t

        return totalSecs
