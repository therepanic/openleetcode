class Solution {
public:
    int longestSubsequence(vector<int>& arr, int difference) {
        unordered_map<int, int> dic;
        int maxLen = 0;
        for (int x : arr) {
            if (dic.count(x - difference)) {
                dic[x] = dic[x - difference] + 1;
            } else {
                dic[x] = 1;
            }
            if (dic[x] > maxLen) {
                maxLen = dic[x];
            }
        }
        return maxLen;
    }
};
