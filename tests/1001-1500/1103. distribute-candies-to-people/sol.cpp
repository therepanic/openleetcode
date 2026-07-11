class Solution {
public:
    vector<int> distributeCandies(int candies, int num_people) {
        vector<int> res(num_people, 0);
        int give = 1;
        int i = 0;

        while (candies > 0) {
            res[i % num_people] += min(give, candies);
            candies -= give;
            give++;
            i++;
        }

        return res;
    }
};
