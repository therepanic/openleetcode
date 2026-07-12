class Solution:
    def minRefuelStops(
        self, target: int, startFuel: int, stations: List[List[int]]
    ) -> int:

        fuel, heap, count = startFuel, [], 0  # <-- initialize some stuff

        stations.append([target, 0])  # <-- this handles the "stations = []" test

        while stations:
            if fuel >= target:
                return count  # <-- 4)

            while stations and stations[0][0] <= fuel:  # <-- 3)
                _, liters = stations.pop(0)
                heappush(heap, -liters)

            if not heap:
                return -1  # <-- 4)
            fuel -= heappop(heap)

            count += 1
