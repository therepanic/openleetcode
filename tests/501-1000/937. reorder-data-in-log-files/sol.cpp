class Solution {
public:
    vector<string> reorderLogFiles(vector<string>& logs) {
        stable_sort(logs.begin(), logs.end(), [](const string& a, const string& b) {
            auto pos1 = a.find(' ');
            auto pos2 = b.find(' ');
            string ident1 = a.substr(0, pos1);
            string ident2 = b.substr(0, pos2);
            string rest1 = a.substr(pos1 + 1);
            string rest2 = b.substr(pos2 + 1);
            bool isDigit1 = isdigit(rest1[0]);
            bool isDigit2 = isdigit(rest2[0]);
            if (!isDigit1 && !isDigit2) {
                if (rest1 != rest2)
                    return rest1 < rest2;
                return ident1 < ident2;
            }
            if (isDigit1 && isDigit2)
                return false;
            return !isDigit1;
        });
        return logs;
    }
};
