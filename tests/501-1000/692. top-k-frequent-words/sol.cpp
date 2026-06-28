class Solution {
public:
    vector<string> topKFrequent(vector<string>& words, int k) {
        unordered_map<string, int> counter;
        for (const auto& w : words) {
            counter[w]++;
        }
        vector<pair<int, string>> heap;
        for (const auto& [w, f] : counter) {
            heap.push_back({-f, w});
        }
        sort(heap.begin(), heap.end());
        vector<string> ans;
        for (int i = 0; i < k; i++) {
            ans.push_back(heap[i].second);
        }
        return ans;
    }
};
