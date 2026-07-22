class Solution {
public:
    int findLeastNumOfUniqueInts(vector<int>& arr, int k) {
        std::unordered_map<int, int> counts;
        for (int num : arr) {
            counts[num]++;
        }
        int remaining = counts.size();
        std::vector<int> frequencies;
        for (const auto& pair : counts) {
            frequencies.push_back(pair.second);
        }
        std::sort(frequencies.begin(), frequencies.end());
        for (int count : frequencies) {
            if (k < count) {
                break;
            }
            k -= count;
            remaining--;
        }
        return remaining;
    }
};
