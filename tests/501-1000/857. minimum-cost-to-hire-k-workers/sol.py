class Solution:
    def mincostToHireWorkers(
        self, quality: List[int], wage: List[int], k: int
    ) -> float:
        # 1. Coordinate Mapping: Map workers to their "Ratio Manifold" (wage/quality)
        # We sort by ratio to define the "Captain" boundary.
        workers = sorted([(w / q, q) for w, q in zip(wage, quality)])

        min_cost = float("inf")
        current_quality_sum = 0
        # 2. The Regret Buffer: A Max-Heap to track the most 'expensive' quality units
        max_heap = []

        for ratio, q in workers:
            current_quality_sum += q
            heapq.heappush(max_heap, -q)

            # 3. Constraint Satisfaction: Ensure the group size is exactly k
            if len(max_heap) > k:
                # Regret step: Eject the worker with the highest quality to minimize total cost
                # This is equivalent to shifting the 'active set' toward lower quality.
                current_quality_sum += heapq.heappop(max_heap)

            # 4. Global Convergence: If we have k workers, calculate the cost for this ratio
            if len(max_heap) == k:
                min_cost = min(min_cost, ratio * current_quality_sum)

        return float(min_cost)
