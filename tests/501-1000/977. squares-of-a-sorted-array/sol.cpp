class Solution {
public:
    vector<int> sortedSquares(vector<int>& nums) {
        vector<int> newarr;
        for (int i : nums) {
            newarr.push_back(i * i);
        }
        sort(newarr.begin(), newarr.end());
        return newarr;
    }
};
