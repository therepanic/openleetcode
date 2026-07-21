class Solution {
    public int numSubmat(int[][] mat) {
        int r = mat.length;
        int c = mat[0].length;
        int[] h = new int[c];
        int ans = 0;
        
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                h[j] = mat[i][j] == 1 ? h[j] + 1 : 0;
            }
            
            int[] sumv = new int[c];
            int[] st = new int[c];
            int top = -1;
            
            for (int j = 0; j < c; j++) {
                while (top >= 0 && h[st[top]] >= h[j]) {
                    top--;
                }
                
                if (top >= 0) {
                    int p = st[top];
                    sumv[j] = sumv[p] + h[j] * (j - p);
                } else {
                    sumv[j] = h[j] * (j + 1);
                }
                
                st[++top] = j;
                ans += sumv[j];
            }
        }
        
        return ans;
    }
}
