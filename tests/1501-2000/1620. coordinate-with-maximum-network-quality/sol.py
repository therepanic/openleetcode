class Solution(object):
    def bestCoordinate(self, towers, radius):
        """
        :type towers: List[List[int]]
        :type radius: int
        :rtype: List[int]
        """
        max_x = max(t[0] for t in towers)
        max_y = max(t[1] for t in towers)

        best_quality = 0
        best_coord = [0, 0]

        for x in range(max_x + 1):
            for y in range(max_y + 1):
                quality = 0
                for tx, ty, q in towers:
                    dist = math.sqrt((tx - x) ** 2 + (ty - y) ** 2)
                    if dist <= radius:
                        quality += int(q / (1 + dist))
                if quality > best_quality or (
                    quality == best_quality and [x, y] < best_coord
                ):
                    best_quality = quality
                    best_coord = [x, y]

        return best_coord
