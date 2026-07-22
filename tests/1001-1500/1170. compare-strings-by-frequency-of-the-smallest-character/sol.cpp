class Solution {
public:
    vector<int> numSmallerByFrequency(vector<string>& queries, vector<string>& words) {
        auto f = [](const string& s) -> int {
            char minChar = 'z';
            int count = 0;
            for (char c : s) {
                if (c < minChar) {
                    minChar = c;
                    count = 1;
                } else if (c == minChar) {
                    count++;
                }
            }
            return count;
        };
        
        vector<int> buckets(12, 0);
        for (const string& w : words) {
            buckets[f(w)]++;
        }
        for (int i = 9; i >= 0; i--) {
            buckets[i] += buckets[i + 1];
        }
        
        vector<int> result;
        for (const string& q : queries) {
            result.push_back(buckets[f(q) + 1]);
        }
        return result;
    }
};
