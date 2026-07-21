class Solution {
public:
    int countTriplets(vector<int>& arr) {
        int totalCount = 0;
        int prefixXor = 0;
        unordered_map<int, int> prefixCount;
        unordered_map<int, int> indexSum;
        prefixCount[0] = 1;
        indexSum[0] = 0;
        for (int k = 1; k <= arr.size(); k++) {
            prefixXor ^= arr[k - 1];
            if (prefixCount.find(prefixXor) != prefixCount.end()) {
                totalCount += prefixCount[prefixXor] * (k - 1) - indexSum[prefixXor];
            } else {
                prefixCount[prefixXor] = 0;
                indexSum[prefixXor] = 0;
            }
            prefixCount[prefixXor]++;
            indexSum[prefixXor] += k;
        }
        return totalCount;
    }
};
