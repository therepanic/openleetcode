class Solution {
public:
    vector<vector<long long>> splitPainting(vector<vector<int>>& segments) {
        vector<pair<int, int>> events;
        for (auto& seg : segments) {
            events.push_back({seg[0], seg[2]});
            events.push_back({seg[1], -seg[2]});
        }
        sort(events.begin(), events.end());
        
        vector<vector<long long>> ans;
        int prev = -1;
        long long mix = 0;
        for (auto& e : events) {
            if (prev != -1) {
                if (e.first != prev && mix != 0) {
                    ans.push_back({(long long)prev, (long long)e.first, mix});
                }
            }
            prev = e.first;
            mix += e.second;
        }
        return ans;
    }
};
