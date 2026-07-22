class Solution {
public:
    vector<int> avoidFlood(vector<int>& rains) {
        int n = rains.size();
        vector<int> res(n, -1);
        unordered_map<int, int> full;
        set<int> dry;
        for (int i = 0; i < n; i++) {
            int lake = rains[i];
            if (lake == 0) {
                dry.insert(i);
                res[i] = 1;
            } else if (full.count(lake)) {
                auto it = dry.upper_bound(full[lake]);
                if (it == dry.end()) return {};
                int j = *it;
                res[j] = lake;
                dry.erase(it);
                full[lake] = i;
            } else {
                full[lake] = i;
            }
        }
        return res;
    }
};
