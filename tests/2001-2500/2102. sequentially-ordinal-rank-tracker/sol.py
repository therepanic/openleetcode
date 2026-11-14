class Solution:
    from sortedcontainers import SortedList

    class SORTracker:

        def __init__(self):
            self.cnt = 0 
            self.data = SortedList()

        def add(self, location: str, score: int) -> None:
            self.data.add((-score, location))

        def get(self) -> str:
            _, location = self.data[self.cnt]
            self.cnt+= 1
            return location
