class Solution {
public:
    int maxEnvelopes(vector<vector<int>>& envelopes) {
        sort(envelopes.begin(), envelopes.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[0] == b[0] ? a[1] > b[1] : a[0] < b[0];
        });
        vector<int> result;
        for (const auto& e : envelopes) {
            int h = e[1];
            auto it = lower_bound(result.begin(), result.end(), h);
            if (it == result.end()) {
                result.push_back(h);
            } else {
                *it = h;
            }
        }
        return result.size();
    }
};
