class Solution:
    def cutOffTree(self, forest: List[List[int]]) -> int:
        rows, cols = len(forest), len(forest[0])

        # Check if starting position is blocked
        if forest[0][0] == 0:
            return -1

        def findShortestPath(startRow, startCol, targetRow, targetCol):
            """Use BFS to find minimum steps between two points"""
            queue = deque([(startRow, startCol, 0)])
            visited = set()
            visited.add((startRow, startCol))
            directions = [(-1, 0), (0, -1), (0, 1), (1, 0)]  # up, left, right, down

            while queue:
                currentRow, currentCol, steps = queue.popleft()

                # Found target location
                if currentRow == targetRow and currentCol == targetCol:
                    return steps

                # Explore all 4 directions
                for deltaRow, deltaCol in directions:
                    newRow, newCol = currentRow + deltaRow, currentCol + deltaCol

                    # Check bounds, walkability, and if not visited
                    if (
                        0 <= newRow < rows
                        and 0 <= newCol < cols
                        and forest[newRow][newCol] > 0
                        and (newRow, newCol) not in visited
                    ):
                        queue.append((newRow, newCol, steps + 1))
                        visited.add((newRow, newCol))

            return -1  # Target unreachable

        # Collect all trees and sort by height using min-heap
        treeHeap = []
        for row in range(rows):
            for col in range(cols):
                if forest[row][col] > 1:
                    heapq.heappush(treeHeap, (forest[row][col], row, col))

        totalSteps = 0
        currentRow, currentCol = 0, 0  # Start at top-left corner

        # Process trees in order from shortest to tallest
        while treeHeap:
            treeHeight, targetRow, targetCol = heapq.heappop(treeHeap)
            stepsToTree = findShortestPath(currentRow, currentCol, targetRow, targetCol)

            if stepsToTree == -1:
                return -1  # Cannot reach this tree

            totalSteps += stepsToTree
            currentRow, currentCol = (
                targetRow,
                targetCol,
            )  # Update position after cutting tree

        return totalSteps
