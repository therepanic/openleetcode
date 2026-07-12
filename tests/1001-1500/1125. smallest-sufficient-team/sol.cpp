#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    vector<int> smallestSufficientTeam(vector<string>& req_skills, vector<vector<string>>& people) {
        int n = (int)req_skills.size();
        int full = (1 << n) - 1;
        unordered_map<string, int> idx;
        for (int i = 0; i < n; ++i) idx[req_skills[i]] = i;

        vector<int> masks;
        masks.reserve(people.size());
        for (auto& person : people) {
            int mask = 0;
            for (auto& skill : person) mask |= 1 << idx[skill];
            masks.push_back(mask);
        }

        vector<vector<int>> dp(1 << n);
        vector<char> seen(1 << n, 0);
        seen[0] = 1;

        for (int i = 0; i < (int)masks.size(); ++i) {
            int pmask = masks[i];
            if (!pmask) continue;
            auto cur = dp;
            auto curSeen = seen;
            for (int mask = 0; mask <= full; ++mask) {
                if (!seen[mask]) continue;
                int nmask = mask | pmask;
                vector<int> cand = dp[mask];
                cand.push_back(i);
                if (!curSeen[nmask] || cand.size() < cur[nmask].size()) {
                    curSeen[nmask] = 1;
                    cur[nmask] = move(cand);
                }
            }
            dp.swap(cur);
            seen.swap(curSeen);
        }

        return dp[full];
    }
};
