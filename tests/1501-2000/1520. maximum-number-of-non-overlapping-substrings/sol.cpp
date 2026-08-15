class Solution {
public:
    vector<string> maxNumOfSubstrings(string s) {
        int n = s.length();
        unordered_map<char, int> counts;
        for (char c : s) counts[c]++;
        unordered_map<char, int> first, last;
        for (auto& [k, v] : counts) {
            first[k] = s.find(k);
            last[k] = s.rfind(k);
        }
        
        vector<string> res;
        deque<array<int,3>> queue;
        
        for (auto& [k, v] : counts) {
            queue.push_front({first[k], last[k], v});
            int left = INT_MAX;
            int right = INT_MIN;
            int total = 0;
            
            for (auto& arr : queue) {
                total += arr[2];
                left = min(left, arr[0]);
                right = max(right, arr[1]);
                if (total == right - left + 1) break;
            }
            
            if (total == right - left + 1) {
                res.push_back(s.substr(left, right - left + 1));
                queue.clear();
            }
        }
        
        return res;
    }
};
