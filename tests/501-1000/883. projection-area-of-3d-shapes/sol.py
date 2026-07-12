class Solution:
    def projectionArea(self, grid: List[List[int]]) -> int:
        # 1. XY Projection: Count non-zero elements (Surface footprint)
        # In image processing, this is equivalent to a binary mask of the object
        xy_area = sum(1 for row in grid for val in row if val > 0)

        # 2. YZ Projection: Sum of max heights for each row
        # This is essentially finding the profile/silhouette from one side
        yz_area = sum(max(row) for row in grid)

        # 3. ZX Projection: Sum of max heights for each column
        # Equivalent to the profile from the orthogonal side
        zx_area = sum(max(col) for col in zip(*grid))

        return xy_area + yz_area + zx_area
