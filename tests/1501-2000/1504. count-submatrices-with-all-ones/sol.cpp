class Solution {
public:
    int numSubmat(vector<vector<int>>& mat) {
        int r = mat.size();
        int c = mat[0].size();
        vector<int> h(c, 0);
        int ans = 0;
        
        for (int i = 0; i < r; i++) {
            for (int j = 0; j < c; j++) {
                h[j] = mat[i][j] ? h[j] + 1 : 0;
            }
            
            vector<int> sumv(c, 0);
            vector<int> st;
            
            for (int j = 0; j < c; j++) {
                while (!st.empty() && h[st.back()] >= h[j]) {
                    st.pop_back();
                }
                
                if (!st.empty()) {
                    int p = st.back();
                    sumv[j] = sumv[p] + h[j] * (j - p);
                } else {
                    sumv[j] = h[j] * (j + 1);
                }
                
                st.push_back(j);
                ans += sumv[j];
            }
        }
        
        return ans;
    }
};
