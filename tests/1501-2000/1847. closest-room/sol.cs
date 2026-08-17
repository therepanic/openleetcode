using System;
using System.Collections.Generic;

public class Solution {
    public int[] ClosestRoom(int[][] rooms, int[][] queries) {
        Array.Sort(rooms, (a, b) => b[1].CompareTo(a[1]));

        int[] idx = new int[queries.Length];
        for (int i = 0; i < queries.Length; i++) idx[i] = i;
        Array.Sort(idx, (a, b) => queries[b][1].CompareTo(queries[a][1]));

        SortedSet<int> active = new SortedSet<int>();
        int[] result = new int[queries.Length];
        Array.Fill(result, -1);
        int roomPtr = 0;

        foreach (int qi in idx) {
            int preferred = queries[qi][0];
            int minimum = queries[qi][1];

            while (roomPtr < rooms.Length && rooms[roomPtr][1] >= minimum) {
                active.Add(rooms[roomPtr][0]);
                roomPtr++;
            }

            List<int> candidates = new List<int>();
            var view = active.GetViewBetween(preferred, int.MaxValue);
            if (view.Count > 0) candidates.Add(view.Min);
            var prevView = active.GetViewBetween(int.MinValue, preferred);
            if (prevView.Count > 0) candidates.Add(prevView.Max);

            if (candidates.Count > 0) {
                int best = candidates[0];
                for (int i = 1; i < candidates.Count; i++) {
                    int id = candidates[i];
                    if (Math.Abs(id - preferred) < Math.Abs(best - preferred) ||
                        (Math.Abs(id - preferred) == Math.Abs(best - preferred) && id < best)) {
                        best = id;
                    }
                }
                result[qi] = best;
            }
        }
        return result;
    }
}
