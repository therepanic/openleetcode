class Solution(object):
    def leastBricks(self, wall):
        edge_counts = {}
        for row in wall:
            edge = 0
            for brick in row[:-1]:
                edge += brick
                edge_counts[edge] = edge_counts.get(edge, 0) + 1
        max_edges = max(edge_counts.values()) if edge_counts else 0
        return len(wall) - max_edges
