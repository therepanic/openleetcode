using System;
using System.Collections.Generic;

public class Solution {
    public int TrapRainWater(int[][] heightMap) {
        if (heightMap == null || heightMap.Length < 3 || heightMap[0].Length < 3) {
            return 0;
        }

        int m = heightMap.Length, n = heightMap[0].Length;
        bool[,] visited = new bool[m, n];
        var heap = new SortedSet<(int height, int x, int y)>();

        for (int i = 0; i < m; i++) {
            heap.Add((heightMap[i][0], i, 0));
            heap.Add((heightMap[i][n - 1], i, n - 1));
            visited[i, 0] = visited[i, n - 1] = true;
        }
        for (int j = 0; j < n; j++) {
            heap.Add((heightMap[0][j], 0, j));
            heap.Add((heightMap[m - 1][j], m - 1, j));
            visited[0, j] = visited[m - 1, j] = true;
        }

        int result = 0;
        int[][] directions = new int[][] {
            new int[] {0, 1}, new int[] {1, 0}, new int[] {0, -1}, new int[] {-1, 0}
        };

        while (heap.Count > 0) {
            var min = heap.Min;
            heap.Remove(min);
            int height = min.height, x = min.x, y = min.y;

            foreach (var dir in directions) {
                int nx = x + dir[0], ny = y + dir[1];
                if (nx >= 0 && nx < m && ny >= 0 && ny < n && !visited[nx, ny]) {
                    result += Math.Max(0, height - heightMap[nx][ny]);
                    heap.Add((Math.Max(height, heightMap[nx][ny]), nx, ny));
                    visited[nx, ny] = true;
                }
            }
        }

        return result;
    }
}
