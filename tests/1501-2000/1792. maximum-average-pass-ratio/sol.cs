using System;
using System.Collections.Generic;

public class Solution {
    public double MaxAverageRatio(int[][] classes, int extraStudents) {
        var pq = new List<Tuple<double, int, int>>();
        foreach (var c in classes) {
            int p = c[0], t = c[1];
            double gain = (double)(p+1)/(t+1) - (double)p/t;
            pq.Add(Tuple.Create(gain, p, t));
        }
        while (extraStudents-- > 0) {
            int best = 0;
            for (int i = 1; i < pq.Count; i++)
                if (pq[i].Item1 > pq[best].Item1) best = i;
            var top = pq[best];
            pq.RemoveAt(best);
            int p = top.Item2+1, t = top.Item3+1;
            double gain = (double)(p+1)/(t+1) - (double)p/t;
            pq.Add(Tuple.Create(gain, p, t));
        }
        double sum = 0.0;
        while (pq.Count > 0) {
            var item = pq[pq.Count - 1];
            pq.RemoveAt(pq.Count - 1);
            sum += (double)item.Item2/item.Item3;
        }
        return sum / classes.Length;
    }
}
