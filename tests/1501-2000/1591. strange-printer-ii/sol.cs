public class Solution {
    public bool IsPrintable(int[][] targetGrid) {
        int m = targetGrid.Length;
        int n = targetGrid[0].Length;
        var colors = new Dictionary<int, List<(int, int)>>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (!colors.ContainsKey(targetGrid[i][j])) colors[targetGrid[i][j]] = new List<(int, int)>();
                colors[targetGrid[i][j]].Add((i, j));
            }
        }
        
        bool CanRemove(int color) {
            var pos = colors[color];
            int mnR = pos[0].Item1, mxR = pos[0].Item1;
            int mnC = pos[0].Item2, mxC = pos[0].Item2;
            foreach (var (r, c) in pos) {
                mnR = Math.Min(mnR, r);
                mxR = Math.Max(mxR, r);
                mnC = Math.Min(mnC, c);
                mxC = Math.Max(mxC, c);
            }
            for (int i = mnR; i <= mxR; i++) {
                for (int j = mnC; j <= mxC; j++) {
                    if (targetGrid[i][j] != color && targetGrid[i][j] > 0) return false;
                }
            }
            for (int i = mnR; i <= mxR; i++) {
                for (int j = mnC; j <= mxC; j++) {
                    targetGrid[i][j] = 0;
                }
            }
            return true;
        }
        
        var colorSet = new HashSet<int>(colors.Keys);
        while (colorSet.Count > 0) {
            var removable = new HashSet<int>();
            foreach (var c in colorSet) {
                if (CanRemove(c)) removable.Add(c);
            }
            if (removable.Count == 0) return false;
            colorSet.ExceptWith(removable);
        }
        return true;
    }
}
