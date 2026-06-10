#include <algorithm>
#include <string>
#include <vector>

using namespace std;

class Solution {
public:
    string largestNumber(vector<int>& nums) {
        vector<string> parts;
        parts.reserve(nums.size());
        for (int num : nums) parts.push_back(to_string(num));
        sort(parts.begin(), parts.end(), [](const string& a, const string& b) {
            return a + b > b + a;
        });
        if (!parts.empty() && parts[0] == "0") return "0";
        string ans;
        for (const string& part : parts) ans += part;
        return ans;
    }
};
