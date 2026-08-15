class Solution(object):
    def countPoints(self, points, queries):
        """
        :type points: List[List[int]]
        :type queries: List[List[int]]
        :rtype: List[int]
        """
        b = [0] * len(queries)
        for i in range(len(queries)):
            for j in range(len(points)):
                if (
                    ((queries[i][0] - points[j][0]) ** 2)
                    + ((queries[i][1] - points[j][1]) ** 2)
                ) <= queries[i][2] ** 2:
                    b[i] += 1
        return b
