class Solution:
    def findCenter(self, edges: List[List[int]]) -> int:
        # Extract nodes from first two edges
        a, b = edges[0]
        c, d = edges[1]

        # Return the common node (center of star graph)
        if a == c or a == d:
            return a
        return b
