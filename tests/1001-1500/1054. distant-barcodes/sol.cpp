class Solution {
public:
    vector<int> rearrangeBarcodes(vector<int>& barcodes) {
        unordered_map<int, int> h;
        for (int i : barcodes) {
            h[i]++;
        }
        priority_queue<pair<int, int>> heap;
        for (auto& [k, v] : h) {
            heap.push({v, k});
        }
        vector<int> l;
        while (heap.size() > 1) {
            auto x = heap.top(); heap.pop();
            auto y = heap.top(); heap.pop();
            l.push_back(x.second);
            l.push_back(y.second);
            if (--x.first > 0) heap.push(x);
            if (--y.first > 0) heap.push(y);
        }
        if (!heap.empty()) {
            l.push_back(heap.top().second);
        }
        return l;
    }
};
