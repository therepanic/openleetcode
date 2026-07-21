class Solution {
public:
    vector<int> filterRestaurants(vector<vector<int>>& restaurants, int veganFriendly, int maxPrice, int maxDistance) {
        vector<vector<int>> restaurantsFiltered;

        for (const auto& restaurant : restaurants) {
            if (veganFriendly == 1 && restaurant[2] != 1) {
                continue;
            }
            
            if (restaurant[3] > maxPrice) {
                continue;
            }

            if (restaurant[4] > maxDistance) {
                continue;
            }

            restaurantsFiltered.push_back({restaurant[1], restaurant[0]});
        }

        sort(restaurantsFiltered.begin(), restaurantsFiltered.end(), [](const vector<int>& a, const vector<int>& b) {
            if (a[0] != b[0]) {
                return a[0] > b[0];
            }
            return a[1] > b[1];
        });

        vector<int> result;

        for (const auto& restaurant : restaurantsFiltered) {
            result.push_back(restaurant[1]);
        }

        return result;
    }
};
