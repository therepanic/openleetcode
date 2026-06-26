class Solution {
public:
    int distributeCandies(vector<int>& candyType) {
        int n = candyType.size();
        int k = n / 2;
        unordered_set<int> set(candyType.begin(), candyType.end());
        return min(k, (int)set.size());
    }
};
