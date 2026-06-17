class Solution {
public:
    vector<int> topKFrequent(vector<int>& nums, int k) {
        unordered_map<int, pair<int, int>> info;
        for (int i = 0; i < (int)nums.size(); i++) {
            int x = nums[i];
            auto it = info.find(x);
            if (it == info.end()) {
                info[x] = {1, i};
            } else {
                it->second.first++;
            }
        }
        vector<tuple<int, int, int>> vec;
        vec.reserve(info.size());
        for (auto& [value, data] : info) {
            vec.emplace_back(data.first, data.second, value);
        }
        sort(vec.begin(), vec.end(), [](const tuple<int, int, int>& a, const tuple<int, int, int>& b) {
            if (get<0>(a) != get<0>(b)) return get<0>(a) > get<0>(b);
            return get<1>(a) < get<1>(b);
        });
        vector<int> result;
        for (int i = 0; i < k; i++) {
            result.push_back(get<2>(vec[i]));
        }
        return result;
    }
};
