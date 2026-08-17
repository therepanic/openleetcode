import numpy as np


class Solution:
    def minOperations(self, nums1: List[int], nums2: List[int]) -> int:
        x, y = sum(nums1), sum(nums2)
        if x == y:
            return 0

        # Constraints: Minimum and Maximum possible sums
        # nums1 can move in [n1, 6*n1], nums2 in [n2, 6*n2]
        if not (
            len(nums2) <= x <= 6 * len(nums2)
            or len(nums1) <= y <= 6 * len(nums1)
            or max(len(nums1), len(nums2)) <= 6 * min(len(nums1), len(nums2))
        ):
            # Checking if the ranges even overlap
            if x < y and 6 * len(nums1) < len(nums2):
                return -1
            if y < x and 6 * len(nums2) < len(nums1):
                return -1

        # Calculate the 'Steepest' available steps (Gains)
        # If x < y, we want to increase x (6-v) and decrease y (v-1)
        if x < y:
            gains = np.concatenate([6 - np.array(nums1), np.array(nums2) - 1])
        else:
            gains = np.concatenate([np.array(nums1) - 1, 6 - np.array(nums2)])

        # Use bincount to get the distribution of the gradient magnitudes
        counts = np.bincount(gains[gains > 0], minlength=6)

        diff = abs(x - y)
        ops = 0

        # Greedily follow the steepest gradient (highest gains first)
        for magnitude in range(5, 0, -1):
            if counts[magnitude] == 0:
                continue

            # Number of steps needed along this gradient component
            steps = min(counts[magnitude], (diff + magnitude - 1) // magnitude)

            ops += steps
            diff -= steps * magnitude

            if diff <= 0:
                return int(ops)

        return -1
