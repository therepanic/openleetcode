class Solution {
public:
    vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {
        vector<pair<int, int>> events;
        for (auto& b : buildings) {
            int L = b[0], R = b[1], H = b[2];
            events.emplace_back(L, -H);
            events.emplace_back(R, H);
        }
        sort(events.begin(), events.end(), [](const pair<int,int>& a, const pair<int,int>& b) {
            if (a.first != b.first) return a.first < b.first;
            return a.second < b.second;
        });

        vector<vector<int>> result;
        priority_queue<int> liveBuildings;
        liveBuildings.push(0);
        unordered_map<int, int> pastBuildings;
        int prevMax = 0;

        for (auto& [x, h] : events) {
            if (h < 0) {
                liveBuildings.push(-h);
            } else {
                pastBuildings[h]++;
            }

            while (!liveBuildings.empty() && pastBuildings.count(liveBuildings.top())) {
                int top = liveBuildings.top();
                liveBuildings.pop();
                pastBuildings[top]--;
                if (pastBuildings[top] == 0) {
                    pastBuildings.erase(top);
                }
            }

            int currMax = liveBuildings.top();
            if (currMax != prevMax) {
                result.push_back({x, currMax});
                prevMax = currMax;
            }
        }

        return result;
    }
};
