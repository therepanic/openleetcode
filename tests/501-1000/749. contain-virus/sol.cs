using System;
using System.Collections.Generic;

public class Solution {
    public int ContainVirus(int[][] isInfected) {
        int rows = isInfected.Length;
        int cols = isInfected[0].Length;
        int[][] directions = new int[][] {
            new int[] {1, 0},
            new int[] {-1, 0},
            new int[] {0, 1},
            new int[] {0, -1}
        };
        int totalWalls = 0;

        while (true) {
            bool[][] seen = new bool[rows][];
            for (int i = 0; i < rows; i++) {
                seen[i] = new bool[cols];
            }
            List<List<int[]>> regions = new List<List<int[]>>();
            List<HashSet<string>> frontiers = new List<HashSet<string>>();
            List<int> wallsNeeded = new List<int>();

            for (int r = 0; r < rows; r++) {
                for (int c = 0; c < cols; c++) {
                    if (isInfected[r][c] != 1 || seen[r][c]) continue;
                    Stack<int[]> stack = new Stack<int[]>();
                    stack.Push(new int[] {r, c});
                    seen[r][c] = true;
                    List<int[]> region = new List<int[]>();
                    HashSet<string> frontier = new HashSet<string>();
                    int walls = 0;
                    while (stack.Count > 0) {
                        int[] cell = stack.Pop();
                        int cr = cell[0], cc = cell[1];
                        region.Add(new int[] {cr, cc});
                        foreach (int[] d in directions) {
                            int nr = cr + d[0];
                            int nc = cc + d[1];
                            if (nr < 0 || nr >= rows || nc < 0 || nc >= cols) continue;
                            if (isInfected[nr][nc] == 1 && !seen[nr][nc]) {
                                seen[nr][nc] = true;
                                stack.Push(new int[] {nr, nc});
                            } else if (isInfected[nr][nc] == 0) {
                                walls++;
                                frontier.Add(nr + "," + nc);
                            }
                        }
                    }
                    regions.Add(region);
                    frontiers.Add(frontier);
                    wallsNeeded.Add(walls);
                }
            }

            if (regions.Count == 0) break;

            int target = 0;
            for (int i = 1; i < frontiers.Count; i++) {
                if (frontiers[i].Count > frontiers[target].Count) {
                    target = i;
                }
            }

            if (frontiers[target].Count == 0) break;

            totalWalls += wallsNeeded[target];

            foreach (int[] cell in regions[target]) {
                isInfected[cell[0]][cell[1]] = -1;
            }

            for (int i = 0; i < regions.Count; i++) {
                if (i == target) continue;
                foreach (string coord in frontiers[i]) {
                    string[] parts = coord.Split(',');
                    int r = int.Parse(parts[0]);
                    int c = int.Parse(parts[1]);
                    isInfected[r][c] = 1;
                }
            }
        }

        return totalWalls;
    }
}
