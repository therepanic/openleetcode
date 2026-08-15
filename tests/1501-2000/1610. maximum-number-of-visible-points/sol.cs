using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public int VisiblePoints(IList<IList<int>> points, int angle, IList<int> location) {
        List<double> angles = new List<double>();
        int same = 0;
        int x0 = location[0], y0 = location[1];
        
        foreach (var p in points) {
            int dx = p[0] - x0;
            int dy = p[1] - y0;
            if (dx == 0 && dy == 0) {
                same++;
                continue;
            }
            double ang = Math.Atan2(dy, dx) * 180.0 / Math.PI;
            angles.Add(ang);
        }
        
        if (angles.Count == 0) return same;
        
        angles.Sort();
        int n = angles.Count;
        List<double> full = new List<double>(angles);
        foreach (double a in angles) full.Add(a + 360);
        
        int maxVis = 0;
        int j = 0;
        for (int i = 0; i < n; i++) {
            while (j < full.Count && full[j] - full[i] <= angle) {
                j++;
            }
            maxVis = Math.Max(maxVis, j - i);
        }
        
        return maxVis + same;
    }
}
