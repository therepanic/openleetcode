import java.util.*;

class Solution {
    public int containVirus(int[][] isInfected) {
        int rows = isInfected.length;
        int cols = isInfected[0].length;
        int[][] directions = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        int totalWalls = 0;

        while (true) {
            boolean[][] seen = new boolean[rows][cols];
            List<List<int[]>> regions = new ArrayList<>();
            List<Set<String>> frontiers = new ArrayList<>();
            List<Integer> wallsNeeded = new ArrayList<>();

            for (int r = 0; r < rows; r++) {
                for (int c = 0; c < cols; c++) {
                    if (isInfected[r][c] != 1 || seen[r][c]) continue;
                    Deque<int[]> stack = new ArrayDeque<>();
                    stack.push(new int[]{r, c});
                    seen[r][c] = true;
                    List<int[]> region = new ArrayList<>();
                    Set<String> frontier = new HashSet<>();
                    int walls = 0;
                    while (!stack.isEmpty()) {
                        int[] cell = stack.pop();
                        int cr = cell[0], cc = cell[1];
                        region.add(new int[]{cr, cc});
                        for (int[] d : directions) {
                            int nr = cr + d[0];
                            int nc = cc + d[1];
                            if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
                            if (isInfected[nr][nc] == 1 && !seen[nr][nc]) {
                                seen[nr][nc] = true;
                                stack.push(new int[]{nr, nc});
                            } else if (isInfected[nr][nc] == 0) {
                                walls++;
                                frontier.add(nr + "," + nc);
                            }
                        }
                    }
                    regions.add(region);
                    frontiers.add(frontier);
                    wallsNeeded.add(walls);
                }
            }

            if (regions.isEmpty()) break;

            int target = 0;
            for (int i = 1; i < frontiers.size(); i++) {
                if (frontiers.get(i).size() > frontiers.get(target).size()) {
                    target = i;
                }
            }

            if (frontiers.get(target).isEmpty()) break;

            totalWalls += wallsNeeded.get(target);

            for (int[] cell : regions.get(target)) {
                isInfected[cell[0]][cell[1]] = -1;
            }

            for (int i = 0; i < regions.size(); i++) {
                if (i == target) continue;
                for (String coord : frontiers.get(i)) {
                    String[] parts = coord.split(",");
                    int r = Integer.parseInt(parts[0]);
                    int c = Integer.parseInt(parts[1]);
                    isInfected[r][c] = 1;
                }
            }
        }

        return totalWalls;
    }
}
