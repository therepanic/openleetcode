public class Solution {
    public int MaxCompatibilitySum(int[][] students, int[][] mentors) {
        int m = students.Length;
        int maxScore = 0;
        int[] perm = Enumerable.Range(0, m).ToArray();
        do {
            int total = 0;
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < students[i].Length; j++) {
                    if (students[i][j] == mentors[perm[i]][j]) total++;
                }
            }
            maxScore = Math.Max(maxScore, total);
        } while (NextPermutation(perm));
        return maxScore;
    }
    
    private bool NextPermutation(int[] a) {
        int n = a.Length;
        int i = n - 2;
        while (i >= 0 && a[i] >= a[i+1]) i--;
        if (i < 0) return false;
        int j = n - 1;
        while (a[j] <= a[i]) j--;
        int t = a[i]; a[i] = a[j]; a[j] = t;
        Array.Reverse(a, i+1, n-i-1);
        return true;
    }
}
