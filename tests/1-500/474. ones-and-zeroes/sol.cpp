#include <vector>
#include <string>
#include <unordered_map>
#include <algorithm>

class Solution {
public:
    int findMaxForm(vector<string>& strs, int m, int n) {
        std::unordered_map<std::string, int> dp;
        dp["0,0"] = 0;
        for (const auto& s : strs) {
            int zeros = 0, ones = 0;
            for (char c : s) {
                if (c == '0') zeros++;
                else ones++;
            }
            auto newDp = dp;
            for (const auto& [key, size] : dp) {
                int comma = key.find(',');
                int z = std::stoi(key.substr(0, comma));
                int o = std::stoi(key.substr(comma + 1));
                int newZ = z + zeros;
                int newO = o + ones;
                if (newZ <= m && newO <= n) {
                    std::string newKey = std::to_string(newZ) + "," + std::to_string(newO);
                    newDp[newKey] = std::max(newDp[newKey], size + 1);
                }
            }
            dp = newDp;
        }
        int maxVal = 0;
        for (const auto& [_, val] : dp) {
            maxVal = std::max(maxVal, val);
        }
        return maxVal;
    }
};
