using System;
using System.Collections.Generic;

public class Solution {
    public int FindCheapestPrice(int n, int[][] flights, int src, int dst, int k) {
        List<(int, int)>[] matrix = new List<(int, int)>[n];
        for (int i = 0; i < n; i++) {
            matrix[i] = new List<(int, int)>();
        }
        foreach (var flight in flights) {
            int u = flight[0], v = flight[1], w = flight[2];
            matrix[u].Add((v, w));
        }

        int[] distance = new int[n];
        Array.Fill(distance, int.MaxValue);
        distance[src] = 0;

        Queue<(int, int)> queue = new Queue<(int, int)>();
        queue.Enqueue((src, 0));
        int steps = 0;

        while (queue.Count > 0) {
            int level = queue.Count;
            if (steps == k + 1) {
                break;
            }
            steps++;

            for (int i = 0; i < level; i++) {
                var (node, dist) = queue.Dequeue();
                foreach (var (v, w) in matrix[node]) {
                    if (w + dist < distance[v]) {
                        distance[v] = w + dist;
                        queue.Enqueue((v, dist + w));
                    }
                }
            }
        }

        return distance[dst] == int.MaxValue ? -1 : distance[dst];
    }
}
