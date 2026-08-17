class Solution:
    def nearestValidPoint(self, x, y, points):
        current_min_distance = 20001
        current_min_index = -1
        for i, [a, b] in enumerate(points):
            if x == a or y == b:
                distance = abs(x - a) + abs(y - b)
                if distance < current_min_distance:
                    current_min_distance = distance
                    current_min_index = i
        return current_min_index
