class Solution {
public:
    vector<vector<string>> displayTable(vector<vector<string>>& orders) {
        set<string> foodItems;
        map<int, unordered_map<string, int>> tableOrders;

        for (auto& order : orders) {
            int table = stoi(order[1]);
            string food = order[2];
            foodItems.insert(food);
            tableOrders[table][food]++;
        }

        vector<string> sortedFoodItems(foodItems.begin(), foodItems.end());
        vector<string> header = {"Table"};
        header.insert(header.end(), sortedFoodItems.begin(), sortedFoodItems.end());

        vector<vector<string>> result;
        result.push_back(header);

        for (auto& [table, foodMap] : tableOrders) {
            vector<string> row = {to_string(table)};
            for (auto& food : sortedFoodItems) {
                row.push_back(to_string(foodMap[food]));
            }
            result.push_back(row);
        }

        return result;
    }
};
