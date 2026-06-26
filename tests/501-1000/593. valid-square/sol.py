class Solution:
    def validSquare(
        self, p1: List[int], p2: List[int], p3: List[int], p4: List[int]
    ) -> bool:
        def get_dist_sq(pt1, pt2):
            return (pt1[0] - pt2[0]) ** 2 + (pt1[1] - pt2[1]) ** 2

        points = [p1, p2, p3, p4]
        distances = set()

        for i in range(4):
            for j in range(i + 1, 4):
                distances.add(get_dist_sq(points[i], points[j]))

        return len(distances) == 2 and 0 not in distances
