class Solution {
public:
    string reformatNumber(string number) {
        string phoneCleared = "";
        for (char c : number) {
            if (isdigit(c)) phoneCleared += c;
        }
        
        vector<string> result;
        while (phoneCleared.length() > 4) {
            result.push_back(phoneCleared.substr(0, 3));
            phoneCleared = phoneCleared.substr(3);
        }
        
        if (phoneCleared.length() == 4) {
            result.push_back(phoneCleared.substr(0, 2));
            result.push_back(phoneCleared.substr(2));
        } else if (!phoneCleared.empty()) {
            result.push_back(phoneCleared);
        }
        
        string output;
        for (int i = 0; i < result.size(); i++) {
            if (i > 0) output += '-';
            output += result[i];
        }
        return output;
    }
};
