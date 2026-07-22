class Solution {
public:
    int maxEqualFreq(vector<int>& nums) {
        unordered_map<int, int> counts;
        unordered_map<int, int> frequencyCounts;
        int best = 0;

        for (int i = 0; i < nums.size(); i++) {
            int value = nums[i];
            int index = i + 1;
            int previous = counts[value];
            if (previous > 0) {
                frequencyCounts[previous]--;
                if (frequencyCounts[previous] == 0) {
                    frequencyCounts.erase(previous);
                }
            }
            counts[value] = previous + 1;
            int frequency = previous + 1;
            frequencyCounts[frequency]++;

            if (frequencyCounts.size() == 1) {
                auto it = frequencyCounts.begin();
                int onlyFrequency = it->first;
                int valueCount = it->second;
                if (onlyFrequency == 1 || valueCount == 1) {
                    best = index;
                }
            } else if (frequencyCounts.size() == 2) {
                auto it = frequencyCounts.begin();
                int first = it->first;
                int second = (++it)->first;
                int low = min(first, second);
                int high = max(first, second);
                if ((low == 1 && frequencyCounts[low] == 1) || (high == low + 1 && frequencyCounts[high] == 1)) {
                    best = index;
                }
            }
        }

        return best;
    }
};
