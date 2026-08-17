class Solution {
    public int maxCompatibilitySum(int[][] students, int[][] mentors) {
        int m = students.length;
        int maxScore = 0;
        int[] perm = new int[m];
        for (int i = 0; i < m; i++) perm[i] = i;
        do {
            int total = 0;
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < students[i].length; j++) {
                    if (students[i][j] == mentors[perm[i]][j]) total++;
                }
            }
            maxScore = Math.max(maxScore, total);
        } while (nextPermutation(perm));
        return maxScore;
    }
    
    private boolean nextPermutation(int[] a) {
        int n = a.length;
        int i = n - 2;
        while (i >= 0 && a[i] >= a[i+1]) i--;
        if (i < 0) return false;
        int j = n - 1;
        while (a[j] <= a[i]) j--;
        swap(a, i, j);
        reverse(a, i+1, n-1);
        return true;
    }
    
    private void swap(int[] a, int i, int j) {
        int t = a[i]; a[i] = a[j]; a[j] = t;
    }
    
    private void reverse(int[] a, int l, int r) {
        while (l < r) {
            int t = a[l]; a[l] = a[r]; a[r] = t;
            l++; r--;
        }
    }
}
