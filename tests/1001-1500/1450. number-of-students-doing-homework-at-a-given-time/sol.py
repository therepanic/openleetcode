from typing import List


class Solution:
    def busyStudent(
        self, startTime: List[int], endTime: List[int], queryTime: int
    ) -> int:
        return sum(
            [
                ((queryTime >= s) and (queryTime <= e))
                for s, e in zip(startTime, endTime)
            ]
        )
