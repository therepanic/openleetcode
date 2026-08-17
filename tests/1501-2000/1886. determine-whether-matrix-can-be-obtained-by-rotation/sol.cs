public class Solution {
    public bool FindRotation(int[][] mat, int[][] target) {
        for (int i = 0; i < 4; i++) {
            if (RowsEqual(mat, target)) return true;
            mat = Rotate(mat);
        }
        return false;
    }

    private bool RowsEqual(int[][] a, int[][] b) {
        if (a.Length != b.Length) return false;
        for (int i = 0; i < a.Length; i++)
            if (!a[i].SequenceEqual(b[i])) return false;
        return true;
    }
    
    private int[][] Rotate(int[][] mat) {
        int n = mat.Length;
        int[][] res = new int[n][];
        for (int i = 0; i < n; i++) {
            res[i] = new int[n];
        }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                res[j][n - 1 - i] = mat[i][j];
            }
        }
        return res;
    }
}

public class SequenceComparer<T> : IEqualityComparer<IEnumerable<T>> {
    public bool Equals(IEnumerable<T> x, IEnumerable<T> y) {
        return x.SequenceEqual(y);
    }
    
    public int GetHashCode(IEnumerable<T> obj) {
        return 0;
    }
}
