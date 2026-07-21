class Solution {
public:
    bool uniqueOccurrences(vector<int>& arr) {
        unordered_map<int, int> d;
        for (int i : arr) {
            if (d.find(i) != d.end()) {
                d[i]++;
            } else {
                d[i] = 1;
            }
        }
        unordered_set<int> s;
        for (auto& pair : d) {
            int value = pair.second;
            if (s.find(value) != s.end()) {
                return false;
            }
            s.insert(value);
        }
        return true;
    }
};
