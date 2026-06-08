class Solution {
public:
    vector<string> restoreIpAddresses(string s) {
        vector<string> result;
        vector<string> parts;
        backtrack(s, 0, parts, result);
        return result;
    }

private:
    void backtrack(const string& s, int index, vector<string>& parts, vector<string>& result) {
        if (parts.size() == 4) {
            if (index == (int)s.size()) {
                result.push_back(parts[0] + "." + parts[1] + "." + parts[2] + "." + parts[3]);
            }
            return;
        }

        for (int len = 1; len <= 3 && index + len <= (int)s.size(); ++len) {
            string part = s.substr(index, len);
            if (isValid(part)) {
                parts.push_back(part);
                backtrack(s, index + len, parts, result);
                parts.pop_back();
            }
        }
    }

    bool isValid(const string& part) {
        if (part.size() > 1 && part[0] == '0') {
            return false;
        }
        int value = stoi(part);
        return value >= 0 && value <= 255;
    }
};
