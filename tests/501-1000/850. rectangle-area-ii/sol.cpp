class Solution {
public:
    int rectangleArea(vector<vector<int>>& rectangles) {
        const int MOD = 1e9 + 7;
        const int OPEN = 0, CLOSE = 1;
        
        vector<tuple<int, int, int, int>> events;
        for (auto& r : rectangles) {
            int x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3];
            events.emplace_back(y1, OPEN, x1, x2);
            events.emplace_back(y2, CLOSE, x1, x2);
        }
        sort(events.begin(), events.end());
        
        long long res = 0;
        int cur_y = get<0>(events[0]);
        vector<pair<int, int>> active;
        
        for (auto& [y, typ, x1, x2] : events) {
            long long q = 0;
            int cur = -1;
            sort(active.begin(), active.end());
            for (auto& [ax1, ax2] : active) {
                q += max(0, ax2 - max(cur, ax1));
                cur = max(cur, ax2);
            }
            
            res = (res + q * (y - cur_y)) % MOD;
            cur_y = y;
            
            if (typ == OPEN) {
                active.emplace_back(x1, x2);
            } else {
                auto it = find(active.begin(), active.end(), make_pair(x1, x2));
                if (it != active.end()) active.erase(it);
            }
        }
        
        return (int)res;
    }
};
