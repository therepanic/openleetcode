import heapq
from collections import defaultdict
from typing import List


class Solution:
    def minCost(
        self, maxTime: int, edges: List[List[int]], passingFees: List[int]
    ) -> int:
        # Number of cities
        n = len(passingFees)

        # Create a graph to store cities and the time required to travel between them
        graph = defaultdict(list)

        # Fill the graph with the roads (edges)
        for u, v, time in edges:
            graph[u].append((v, time))
            graph[v].append((u, time))

        # Initialize cost array: costs[i] will hold the minimum cost to reach city i
        costs = [float("inf")] * n
        # Initialize time array: times[i] will hold the minimum time to reach city i
        times = [maxTime + 1] * n
        # Starting at city 0 with its passing fee
        times[0] = 0
        costs[0] = passingFees[0]

        # Min-heap (priority queue) to always expand the node with the least cost and time
        queue = [
            (passingFees[0], 0, 0)
        ]  # (current total cost, current time, current city)

        while queue:
            # Pop the city with the smallest cost and time from the priority queue
            curr_cost, curr_time, curr_city = heapq.heappop(queue)

            # If we have reached the destination city (city n - 1), return the cost
            if curr_city == n - 1:
                return curr_cost

            # Explore all the neighboring cities (neighbors and the time to reach them)
            for next_city, travel_time in graph[curr_city]:
                # If traveling to the next city exceeds the maxTime, skip this path
                if curr_time + travel_time > maxTime:
                    continue

                # Calculate the new time and cost after moving to the next city
                new_time = curr_time + travel_time
                new_cost = curr_cost + passingFees[next_city]

                # If we find a cheaper way to reach next_city, update the cost and time
                if new_cost < costs[next_city] or new_time < times[next_city]:
                    costs[next_city] = new_cost
                    times[next_city] = new_time
                    # Push the updated city state into the priority queue
                    heapq.heappush(queue, (new_cost, new_time, next_city))

        # If we cannot reach the destination city within the allowed time, return -1
        return -1
