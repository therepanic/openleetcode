using System;
using System.Collections.Generic;

public class Solution
{
    public int MinFlips(int[][] mat)
    {
        int m = mat.Length;
        int n = mat[0].Length;
        var masks = new List<int>(m * n);
        int[,] dirs = new int[,] { { 0, 0 }, { 1, 0 }, { -1, 0 }, { 0, 1 }, { 0, -1 } };

        for (int r = 0; r < m; ++r)
        {
            for (int c = 0; c < n; ++c)
            {
                int mask = 0;
                for (int i = 0; i < 5; ++i)
                {
                    int nr = r + dirs[i, 0];
                    int nc = c + dirs[i, 1];
                    if (0 <= nr && nr < m && 0 <= nc && nc < n)
                    {
                        mask |= 1 << (nr * n + nc);
                    }
                }
                masks.Add(mask);
            }
        }

        int start = 0;
        for (int r = 0; r < m; ++r)
        {
            for (int c = 0; c < n; ++c)
            {
                if (mat[r][c] == 1)
                {
                    start |= 1 << (r * n + c);
                }
            }
        }

        int size = 1 << (m * n);
        int[] dist = new int[size];
        Array.Fill(dist, -1);
        var q = new Queue<int>();
        dist[start] = 0;
        q.Enqueue(start);

        while (q.Count > 0)
        {
            int state = q.Dequeue();
            int steps = dist[state];
            if (state == 0)
            {
                return steps;
            }

            foreach (int mask in masks)
            {
                int next = state ^ mask;
                if (dist[next] == -1)
                {
                    dist[next] = steps + 1;
                    q.Enqueue(next);
                }
            }
        }

        return -1;
    }
}
