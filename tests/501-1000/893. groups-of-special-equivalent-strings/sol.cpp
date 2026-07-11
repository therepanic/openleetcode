class Solution {
public:
    int numSpecialEquivGroups(vector<string>& words) {
        unordered_set<string> seen;
        for (const string& w : words) {
            string even, odd;
            for (int i = 0; i < w.size(); i++) {
                if (i % 2 == 0) even += w[i];
                else odd += w[i];
            }
            sort(even.begin(), even.end());
            sort(odd.begin(), odd.end());
            seen.insert(even + "," + odd);
        }
        return seen.size();
    }
};
