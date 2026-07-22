class Solution {
public:
    int minSteps(string s, string t) {
        unordered_map<char, int> dic;
        for (char ch : t) {
            dic[ch]++;
        }
        for (char ch : s) {
            if (dic.count(ch) && dic[ch] > 0) {
                dic[ch]--;
            }
        }
        int sum = 0;
        for (auto& [key, val] : dic) {
            sum += val;
        }
        return sum;
    }
};
