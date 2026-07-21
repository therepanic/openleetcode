class Solution {
public:
    int minSetSize(vector<int>& arr) {
        unordered_map<int, int> freq;
        for (int num : arr) {
            freq[num]++;
        }
        
        vector<int> counts;
        for (auto& p : freq) {
            counts.push_back(p.second);
        }
        sort(counts.rbegin(), counts.rend());
        
        int sumRemoved = 0;
        int minSetSize = 0;
        for (int count : counts) {
            sumRemoved += count;
            minSetSize++;
            if (sumRemoved >= arr.size() / 2) {
                return minSetSize;
            }
        }
        return minSetSize;
    }
};
