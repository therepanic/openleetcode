class Solution {
public:
    vector<bool> kidsWithCandies(vector<int>& candies, int extraCandies) {
        int currentMax = *max_element(candies.begin(), candies.end());
        vector<bool> result;
        for (int candyCount : candies) {
            if (candyCount + extraCandies >= currentMax) {
                result.push_back(true);
            } else {
                result.push_back(false);
            }
        }
        return result;
    }
};
