class Solution {
public:
    int findLucky(vector<int>& arr) {
        unordered_map<int, int> freq;
        for (int num : arr) {
            freq[num]++;
        }
        
        int lucky = -1;
        for (auto& [num, count] : freq) {
            if (num == count) {
                lucky = max(lucky, num);
            }
        }
        
        return lucky;
    }
};
