class Solution:
    def numBusesToDestination(
        self, routes: List[List[int]], source: int, target: int
    ) -> int:
        if source == target:
            return 0
        adj = defaultdict(set)

        for bus, locations in enumerate(routes):
            for location in locations:
                adj[location].add(bus)

        queue = deque(adj[target])
        cost = 0
        visited = set()

        while queue:
            cost += 1
            for _ in range(len(queue)):
                node = queue.popleft()
                visited.add(node)
                if source in routes[node]:
                    return cost
                queue.extend(
                    bus
                    for location in routes[node]
                    for bus in adj[location]
                    if bus not in visited
                )

        return -1
