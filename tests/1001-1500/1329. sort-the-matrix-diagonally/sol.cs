using System.Collections.Generic;

public class Solution {
    public int[][] DiagonalSort(int[][] mat) {
        int m = mat.Length, n = mat[0].Length;
        Dictionary<int, List<int>> diagonals = new Dictionary<int, List<int>>();
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                int key = i - j;
                if (!diagonals.ContainsKey(key)) {
                    diagonals[key] = new List<int>();
                }
                diagonals[key].Add(mat[i][j]);
            }
        }
        
        foreach (var list in diagonals.Values) {
            list.Sort((a, b) => b - a);
        }
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                var list = diagonals[i - j];
                mat[i][j] = list[list.Count - 1];
                list.RemoveAt(list.Count - 1);
            }
        }
        
        return mat;
    }
}
