class Solution {
    public List<List<Integer>> reconstructMatrix(int upper, int lower, int[] colsum) {
        int sum = 0;
        for (int c : colsum) sum += c;
        if (upper + lower != sum) return new ArrayList<>();
        
        int n = colsum.length;
        List<List<Integer>> res = new ArrayList<>();
        List<Integer> row1 = new ArrayList<>();
        List<Integer> row2 = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            row1.add(0);
            row2.add(0);
        }
        
        for (int i = 0; i < n; i++) {
            if (colsum[i] == 2) {
                row1.set(i, 1);
                row2.set(i, 1);
                upper--;
                lower--;
            } else if (colsum[i] == 1) {
                if (upper > lower) {
                    row1.set(i, 1);
                    upper--;
                } else {
                    row2.set(i, 1);
                    lower--;
                }
            }
        }
        
        if (lower == 0 && upper == 0) {
            res.add(row1);
            res.add(row2);
            return res;
        }
        return new ArrayList<>();
    }
}
