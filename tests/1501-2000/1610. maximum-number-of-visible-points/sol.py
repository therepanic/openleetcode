import numpy as np


class Solution:
    def visiblePoints(
        self, points: List[List[int]], angle: int, location: List[int]
    ) -> int:
        pts = np.array(points)
        loc = np.array(location)

        # 1. Vectorized Radial Projection
        # Translate points to origin (observer location)
        diff = pts - loc

        # Identify points at the same location (Singularities)
        is_same = np.all(diff == 0, axis=1)
        same_pos_count = np.sum(is_same)

        # Filter out singularities for angular calculation
        valid_diff = diff[~is_same]
        if valid_diff.size == 0:
            return int(same_pos_count)

        # 2. Coordinate Transformation (Atan2 SIMD)
        # Calculate degrees for all points in a single vectorized call
        angles = np.degrees(np.arctan2(valid_diff[:, 1], valid_diff[:, 0]))
        angles.sort()

        # 3. Manifold Linearization (Circular Wrap)
        # Duplicate the manifold to handle the 360° boundary
        full_manifold = np.concatenate([angles, angles + 360])

        # 4. Vectorized Sliding Window (The Search Partition)
        # For every starting angle, find the furthest 'right' index
        # where angle_right <= angle_start + field_of_view
        n = len(angles)
        # searchsorted performs a vectorized binary search for every element
        right_indices = np.searchsorted(full_manifold, angles + angle, side="right")

        # Visibility counts = right_index - current_index
        left_indices = np.arange(n)
        max_visible = np.max(right_indices - left_indices)

        return int(max_visible + same_pos_count)
