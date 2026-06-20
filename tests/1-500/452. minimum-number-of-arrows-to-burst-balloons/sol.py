class Solution(object):
    def findMinArrowShots(self, points):
        points.sort(key=lambda x: x[1])
        arrows = 1
        end = points[0][1]
        for start, finish in points:
            if start > end:
                arrows += 1
                end = finish
        return arrows
