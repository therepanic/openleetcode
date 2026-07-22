public class Solution {
    public IList<IList<int>> ReconstructMatrix(int upper, int lower, int[] colsum) {
        int sum = 0;
        foreach (int c in colsum) sum += c;
        if (upper + lower != sum) return new List<IList<int>>();
        
        int n = colsum.Length;
        int[] row1 = new int[n];
        int[] row2 = new int[n];
        
        for (int i = 0; i < n; i++) {
            if (colsum[i] == 2) {
                row1[i] = 1;
                row2[i] = 1;
                upper--;
                lower--;
            } else if (colsum[i] == 1) {
                if (upper > lower) {
                    row1[i] = 1;
                    upper--;
                } else {
                    row2[i] = 1;
                    lower--;
                }
            }
        }
        
        if (lower == 0 && upper == 0) {
            return new List<IList<int>> { new List<int>(row1), new List<int>(row2) };
        }
        return new List<IList<int>>();
    }
}
