class Solution:
    def containVirus(self, isInfected):
        rows = len(isInfected)
        cols = len(isInfected[0])
        directions = ((1, 0), (-1, 0), (0, 1), (0, -1))
        total_walls = 0

        while True:
            seen = [[False] * cols for _ in range(rows)]
            regions = []
            frontiers = []
            walls_needed = []

            for r in range(rows):
                for c in range(cols):
                    if isInfected[r][c] != 1 or seen[r][c]:
                        continue
                    stack = [(r, c)]
                    seen[r][c] = True
                    region = []
                    frontier = set()
                    walls = 0
                    for cr, cc in stack:
                        region.append((cr, cc))
                        for dr, dc in directions:
                            nr = cr + dr
                            nc = cc + dc
                            if nr < 0 or nr >= rows or nc < 0 or nc >= cols:
                                continue
                            if isInfected[nr][nc] == 1 and not seen[nr][nc]:
                                seen[nr][nc] = True
                                stack.append((nr, nc))
                            elif isInfected[nr][nc] == 0:
                                walls += 1
                                frontier.add((nr, nc))
                    regions.append(region)
                    frontiers.append(frontier)
                    walls_needed.append(walls)

            if not regions:
                break

            target = 0
            for i in range(1, len(frontiers)):
                if len(frontiers[i]) > len(frontiers[target]):
                    target = i

            if not frontiers[target]:
                break

            total_walls += walls_needed[target]

            for r, c in regions[target]:
                isInfected[r][c] = -1

            for i in range(len(regions)):
                if i == target:
                    continue
                for r, c in frontiers[i]:
                    isInfected[r][c] = 1

        return total_walls
