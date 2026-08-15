class Solution:
    def slowestKey(self, releaseTimes: List[int], keysPressed: str) -> str:
        max_time = releaseTimes[0]
        ans = keysPressed[0]

        for i in range(1, len(releaseTimes)):
            curr_time = releaseTimes[i] - releaseTimes[i - 1]

            if curr_time > max_time:
                max_time = curr_time
                ans = keysPressed[i]

            elif curr_time == max_time:
                ans = max(ans, keysPressed[i])

        return ans
