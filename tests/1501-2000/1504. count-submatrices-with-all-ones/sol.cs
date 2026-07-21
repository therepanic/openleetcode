public class Solution {
    public int NumSubmat(int[][] mat) {
        int r = mat.Length;
        int c = mat[0].Length;
        int[] h = new int[c];
        int ans = 0;
        
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                h[j] = mat[i][j] == 1 ? h[j] + 1 : 0;
            }
            
            int[] sumv = new int[c];
            var st = new List<int>();
            
            for (int j = 0; j < c; j++) {
                while (st.Count > 0 && h[st[st.Count - 1]] >= h[j]) {
                    st.RemoveAt(st.Count - 1);
                }
                
                if (st.Count > 0) {
                    int p = st[st.Count - 1];
                    sumv[j] = sumv[p] + h[j] * (j - p);
                } else {
                    sumv[j] = h[j] * (j + 1);
                }
                
                st.Add(j);
                ans += sumv[j];
            }
        }
        
        return ans;
    }
}
