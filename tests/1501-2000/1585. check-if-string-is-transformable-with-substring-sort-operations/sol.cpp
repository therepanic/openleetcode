class Solution {
public:
    bool isTransformable(string s, string t) {
        string sc = s, tc = t;
        sort(sc.begin(), sc.end());
        sort(tc.begin(), tc.end());
        if (sc != tc) return false;
        
        vector<deque<int>> pos(10);
        for (int i = 0; i < s.size(); i++) {
            pos[s[i]-'0'].push_back(i);
        }
            
        for (char tt : t) {
            int dig = tt-'0';
            int i = pos[dig].front();
            pos[dig].pop_front();
            for (int ii = 0; ii < dig; ii++) {
                if (!pos[ii].empty() && pos[ii].front() < i) return false;
            }
        }
        return true;
    }
};
