from typing import List


class Solution:
    def eliminateMaximum(self, dist: List[int], speed: List[int]) -> int:
        arrival = []

        for d, s in zip(dist, speed):
            arrival.append((d + s - 1) // s)

        arrival.sort()

        for minute, time in enumerate(arrival):
            if time <= minute:
                return minute

        return len(arrival)
