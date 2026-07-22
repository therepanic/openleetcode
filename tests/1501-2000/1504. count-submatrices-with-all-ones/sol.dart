class Solution {
  int numSubmat(List<List<int>> mat) {
    int r = mat.length;
    int c = mat[0].length;
    List<int> h = List.filled(c, 0);
    int ans = 0;
    
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c; j++) {
        h[j] = mat[i][j] == 1 ? h[j] + 1 : 0;
      }
      
      List<int> sumv = List.filled(c, 0);
      List<int> st = [];
      
      for (int j = 0; j < c; j++) {
        while (st.isNotEmpty && h[st.last] >= h[j]) {
          st.removeLast();
        }
        
        if (st.isNotEmpty) {
          int p = st.last;
          sumv[j] = sumv[p] + h[j] * (j - p);
        } else {
          sumv[j] = h[j] * (j + 1);
        }
        
        st.add(j);
        ans += sumv[j];
      }
    }
    
    return ans;
  }
}
