class Solution {
public:
    vector<vector<int>> kSmallestPairs(vector<int>& nums1, vector<int>& nums2, int k) {
        vector<vector<int>> result;
        if (nums1.empty() || nums2.empty()) {
            return result;
        }

        auto cmp = [](const tuple<int, int, int>& a, const tuple<int, int, int>& b) {
            if (get<0>(a) != get<0>(b)) return get<0>(a) > get<0>(b);
            if (get<1>(a) != get<1>(b)) return get<1>(a) > get<1>(b);
            return get<2>(a) > get<2>(b);
        };
        priority_queue<tuple<int, int, int>, vector<tuple<int, int, int>>, decltype(cmp)> pq(cmp);
        set<pair<int, int>> visited;

        pq.emplace(nums1[0] + nums2[0], 0, 0);
        visited.insert({0, 0});

        while (!pq.empty() && result.size() < k) {
            auto [sum, i, j] = pq.top();
            pq.pop();
            result.push_back({nums1[i], nums2[j]});

            if (j + 1 < nums2.size() && visited.find({i, j + 1}) == visited.end()) {
                visited.insert({i, j + 1});
                pq.emplace(nums1[i] + nums2[j + 1], i, j + 1);
            }

            if (i + 1 < nums1.size() && visited.find({i + 1, j}) == visited.end()) {
                visited.insert({i + 1, j});
                pq.emplace(nums1[i + 1] + nums2[j], i + 1, j);
            }
        }

        return result;
    }
};
