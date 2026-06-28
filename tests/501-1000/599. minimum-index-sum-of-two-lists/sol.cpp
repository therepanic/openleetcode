class Solution {
public:
    vector<string> findRestaurant(vector<string>& list1, vector<string>& list2) {
        unordered_map<string, int> mp;
        mp[list1[0]] = INT_MIN;
        for (int i = 1; i < list1.size(); i++) {
            mp[list1[i]] = -i;
        }
        if (mp.find(list2[0]) == mp.end()) {
            mp[list2[0]] = INT_MIN;
        } else {
            if (mp[list2[0]] != INT_MIN) {
                mp[list2[0]] = abs(mp[list2[0]]);
            } else {
                mp[list2[0]] = 0;
            }
        }
        for (int i = 1; i < list2.size(); i++) {
            if (mp.find(list2[i]) != mp.end()) {
                if (mp[list2[i]] != INT_MIN) {
                    mp[list2[i]] = abs(mp[list2[i]]) + i;
                } else {
                    mp[list2[i]] = i;
                }
            } else {
                mp[list2[i]] = -i;
            }
        }
        int minVal = INT_MAX;
        for (const auto& p : mp) {
            if (p.second >= 0) {
                minVal = min(minVal, p.second);
            }
        }
        vector<string> ans;
        for (const auto& p : mp) {
            if (p.second >= 0 && p.second == minVal) {
                ans.push_back(p.first);
            }
        }
        return ans;
    }
};
