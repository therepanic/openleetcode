class Solution:
    def distanceBetweenBusStops(
        self, distance: List[int], start: int, destination: int
    ) -> int:
        if destination < start:
            start, destination = destination, start
        return min(
            sum(distance[start:destination]),
            sum(distance) - sum(distance[start:destination]),
        )
