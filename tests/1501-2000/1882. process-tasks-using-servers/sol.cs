using System;
using System.Collections.Generic;

public class Solution {
    public int[] AssignTasks(int[] servers, int[] tasks) {
        int n = servers.Length;
        int m = tasks.Length;
        
        var available = new SortedSet<(int, int)>();
        for (int i = 0; i < n; i++) {
            available.Add((servers[i], i));
        }
        
        var busy = new SortedSet<(int, int, int)>();
        int[] ans = new int[m];
        int time = 0;
        
        for (int i = 0; i < m; i++) {
            time = Math.Max(time, i);
            while (busy.Count > 0 && busy.Min.Item1 <= time) {
                var first = busy.Min;
                busy.Remove(first);
                available.Add((first.Item2, first.Item3));
            }
            
            if (available.Count == 0) {
                time = busy.Min.Item1;
                while (busy.Count > 0 && busy.Min.Item1 <= time) {
                    var first = busy.Min;
                    busy.Remove(first);
                    available.Add((first.Item2, first.Item3));
                }
            }
            
            var server = available.Min;
            available.Remove(server);
            busy.Add((time + tasks[i], server.Item1, server.Item2));
            ans[i] = server.Item2;
        }
        
        return ans;
    }
}
