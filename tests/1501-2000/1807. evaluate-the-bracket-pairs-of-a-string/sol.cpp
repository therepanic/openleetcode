class Solution {
public:
    string evaluate(string s, vector<vector<string>>& knowledge) {
        unordered_map<string, string> mp;
        for (auto& pair : knowledge) {
            mp[pair[0]] = pair[1];
        }
        string ans;
        int i = 0, n = s.size();
        while (i < n) {
            if (s[i] == '(') {
                i++;
                string temp;
                while (i < n && s[i] != ')') {
                    temp += s[i];
                    i++;
                }
                if (mp.count(temp)) ans += mp[temp];
                else ans += "?";
                i++;
            } else {
                ans += s[i];
                i++;
            }
        }
        return ans;
    }
};
