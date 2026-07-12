class Solution {
public:
    vector<vector<int>> intervalIntersection(vector<vector<int>>& firstList, vector<vector<int>>& secondList) {
        if (firstList.empty() || secondList.empty()) {
            return {};
        }
        
        int n = firstList.size(), m = secondList.size();
        vector<vector<int>> res;
        int i = 0, j = 0;
        
        while (i < n && j < m) {
            int s1 = firstList[i][0], e1 = firstList[i][1];
            int s2 = secondList[j][0], e2 = secondList[j][1];
            
            if (e1 >= s2 && s1 <= e2) {
                res.push_back({max(s1, s2), min(e1, e2)});
            }
            
            if (e1 > e2) {
                j++;
            } else {
                i++;
            }
        }
        
        return res;
    }
};
