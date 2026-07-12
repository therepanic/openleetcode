class Solution {
public:
    int largestValsFromLabels(vector<int>& values, vector<int>& labels, int numWanted, int useLimit) {
        int n = values.size();
        vector<pair<int, int>> pairs;
        for (int i = 0; i < n; i++) {
            pairs.push_back({values[i], labels[i]});
        }
        sort(pairs.begin(), pairs.end(), [](const pair<int, int>& a, const pair<int, int>& b) {
            return a.first > b.first;
        });
        int res = 0;
        unordered_map<int, int> freq;
        for (auto& [value, label] : pairs) {
            if (numWanted == 0) break;
            if (freq.find(label) == freq.end() || freq[label] < useLimit) {
                res += value;
                freq[label]++;
                numWanted--;
            }
        }
        return res;
    }
};
