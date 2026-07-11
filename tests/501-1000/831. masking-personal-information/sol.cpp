class Solution {
public:
    string maskPII(string s) {
        if (s.find('@') != string::npos) {
            int at_pos = s.find('@');
            string name = s.substr(0, at_pos);
            string domain = s.substr(at_pos + 1);
            for (char& c : name) c = tolower(c);
            for (char& c : domain) c = tolower(c);
            name = name[0] + string("*****") + name.back();
            return name + "@" + domain;
        } else {
            string gg;
            for (char x : s) {
                if (isdigit(x)) {
                    gg += x;
                }
            }
            int l = gg.size();
            if (l > 10) {
                return "+" + string(l - 10, '*') + "-***-***-" + gg.substr(l - 4);
            }
            return "***-***-" + gg.substr(l - 4);
        }
    }
};
