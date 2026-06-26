class Solution:
    def outerTrees(self, trees: List[List[int]]) -> List[List[int]]:
        if len(trees) == 1:
            return trees

        def cross(o, a, b):
            # Cross product (o -> a) x (o -> b)
            return (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0])

        # Sort points by x, then by y
        trees.sort()

        lower = []
        for p in trees:
            while len(lower) >= 2 and cross(lower[-2], lower[-1], p) < 0:
                lower.pop()
            lower.append(p)

        upper = []
        for p in reversed(trees):
            while len(upper) >= 2 and cross(upper[-2], upper[-1], p) < 0:
                upper.pop()
            upper.append(p)

        # Concatenate lower and upper to get full hull
        # Remove last point of each (it's the same as the first point of the other)
        full_hull = lower[:-1] + upper[:-1]

        # Remove duplicates (in case of colinear boundary points)
        return list(map(list, set(map(tuple, full_hull))))
