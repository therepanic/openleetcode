using System;
using System.Collections.Generic;

public class Solution {
    public int[] GridIllumination(int n, int[][] lamps, int[][] queries) {
        Dictionary<int, int> rowCount = new Dictionary<int, int>();
        Dictionary<int, int> colCount = new Dictionary<int, int>();
        Dictionary<int, int> diag1 = new Dictionary<int, int>();
        Dictionary<int, int> diag2 = new Dictionary<int, int>();
        HashSet<(int, int)> lampSet = new HashSet<(int, int)>();
        int[] ans = new int[queries.Length];
        int[][] dirs = new int[][] {
            new int[] {-1,-1}, new int[] {-1,0}, new int[] {-1,1},
            new int[] {0,-1},  new int[] {0,0},  new int[] {0,1},
            new int[] {1,-1},  new int[] {1,0},  new int[] {1,1}
        };
        
        foreach (var lamp in lamps) {
            int r = lamp[0], c = lamp[1];
            var key = (r, c);
            if (!lampSet.Contains(key)) {
                lampSet.Add(key);
                rowCount[r] = rowCount.GetValueOrDefault(r, 0) + 1;
                colCount[c] = colCount.GetValueOrDefault(c, 0) + 1;
                diag1[r - c] = diag1.GetValueOrDefault(r - c, 0) + 1;
                diag2[r + c] = diag2.GetValueOrDefault(r + c, 0) + 1;
            }
        }
        
        for (int i = 0; i < queries.Length; i++) {
            int r = queries[i][0], c = queries[i][1];
            if (rowCount.GetValueOrDefault(r, 0) > 0 || colCount.GetValueOrDefault(c, 0) > 0 ||
                diag1.GetValueOrDefault(r - c, 0) > 0 || diag2.GetValueOrDefault(r + c, 0) > 0) {
                ans[i] = 1;
                foreach (var d in dirs) {
                    int nr = r + d[0], nc = c + d[1];
                    var key = (nr, nc);
                    if (lampSet.Contains(key)) {
                        lampSet.Remove(key);
                        rowCount[nr]--;
                        colCount[nc]--;
                        diag1[nr - nc]--;
                        diag2[nr + nc]--;
                    }
                }
            } else {
                ans[i] = 0;
            }
        }
        return ans;
    }
}
