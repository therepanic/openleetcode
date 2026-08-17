class Solution {
public:
    int minOperations(vector<int>& target, vector<int>& arr) {
        unordered_map<int, int> targetIndexMap;
        for (int i = 0; i < target.size(); i++) {
            targetIndexMap[target[i]] = i;
        }
        
        vector<int> transformedArr;
        for (int num : arr) {
            if (targetIndexMap.count(num)) {
                transformedArr.push_back(targetIndexMap[num]);
            }
        }
        
        vector<int> lis;
        for (int index : transformedArr) {
            auto it = lower_bound(lis.begin(), lis.end(), index);
            if (it == lis.end()) {
                lis.push_back(index);
            } else {
                *it = index;
            }
        }
        
        return target.size() - lis.size();
    }
};
