import numpy as np


class Solution:
    def bestRotation(self, nums: List[int]) -> int:
        n = len(nums)
        nums = np.array(nums, dtype=np.int32)
        indices = np.arange(n, dtype=np.int32)

        # 1. Calculate the 'Boundaries' for the 'Point Loss' intervals
        # Left boundary: where the element starts to be worth 0 points
        # Right boundary: where the element becomes worth 1 point again
        left = (indices - nums + 1) % n
        right = (indices + 1) % n

        # 2. Construct the Derivative Array (Difference Array)
        # Instead of a loop, we use np.add.at for vectorized accumulation
        # at specific boundary indices.
        diffs = np.zeros(n + 1, dtype=np.int32)

        # Subtract at point-loss start, add at point-loss end
        np.add.at(diffs, left, -1)
        np.add.at(diffs, right, 1)

        # 3. Handle the Toroidal Wrap-around
        # If left > right, the 'bad' interval crosses the k=0 boundary.
        # We find these cases via vector comparison and apply the correction.
        wraps = left > right
        # For every wrapped interval, the score at k=0 is decreased
        diffs[0] -= np.sum(wraps)

        # 4. Discrete Integration (Abel Accumulation)
        # Integrating the deltas and adding the base constant 'n'
        scores = np.cumsum(diffs[:-1]) + n

        # 5. Peak Detection on the Manifold
        return int(np.argmax(scores))
