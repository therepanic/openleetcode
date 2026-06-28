class Solution:
    def maxChunksToSorted(self, arr: List[int]) -> int:
        """
        Calculates the maximum possible chunk partitions using dual-front
        monotonic envelope tracking.
        """
        n = len(arr)

        # Step 1: Backward sweep to build the right minimum envelope
        min_right = [0] * n
        current_min = float("inf")
        for i in range(n - 1, -1, -1):
            if arr[i] < current_min:
                current_min = arr[i]
            min_right[i] = current_min

        # Step 2: Forward sweep to track the left maximum envelope and count valid slices
        chunks = 0
        current_max = float("-inf")

        for i in range(n - 1):
            if arr[i] > current_max:
                current_max = arr[i]

            # Decoupling Condition: If the highest peak on the left doesn't spill over
            # into the lowest valley on the right, we can safely slice a chunk boundary.
            if current_max <= min_right[i + 1]:
                chunks += 1

        # The final remaining segment always forms the last chunk
        return chunks + 1
