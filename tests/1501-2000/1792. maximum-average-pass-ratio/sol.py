class Solution:
    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:
        # Lambda to calculate the gain of adding an extra student
        def _calculate_gain(passes, total_students):
            return (passes + 1) / (total_students + 1) - passes / total_students

        # Max heap to store (-gain, passes, total_students)
        max_heap = []
        for passes, total_students in classes:
            gain = _calculate_gain(passes, total_students)
            max_heap.append((-gain, passes, total_students))

        # Use heapify to transform the list into a valid heap in O(n)
        heapq.heapify(max_heap)

        # Distribute extra students
        for _ in range(extraStudents):
            current_gain, passes, total_students = heapq.heappop(max_heap)
            heapq.heappush(
                max_heap,
                (
                    -_calculate_gain(passes + 1, total_students + 1),
                    passes + 1,
                    total_students + 1,
                ),
            )

        # Calculate the final average pass ratio
        total_pass_ratio = sum(
            passes / total_students for _, passes, total_students in max_heap
        )
        return total_pass_ratio / len(classes)

    def maxAverageRatio(self, classes, extraStudents):
        def gain(p, t):
            return (p + 1) / (t + 1) - p / t

        pq = [(-gain(p, t), p, t) for p, t in classes]
        heapq.heapify(pq)
        for _ in range(extraStudents):
            g, p, t = heapq.heappop(pq)
            p, t = p + 1, t + 1
            heapq.heappush(pq, (-gain(p, t), p, t))
        return sum(p / t for _, p, t in pq) / len(classes)
