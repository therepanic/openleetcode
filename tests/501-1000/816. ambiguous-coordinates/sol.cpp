class Solution {
public:
    vector<string> ambiguousCoordinates(string s) {
        s = s.substr(1, s.size() - 2);
        vector<string> finalResults;
        
        auto getValidNumbers = [](const string& numStr) -> vector<string> {
            vector<string> res;
            
            for (int i = 1; i <= numStr.size(); i++) {
                string left = numStr.substr(0, i);
                string right = numStr.substr(i);
                
                if ((left.size() > 1 && left[0] == '0') || 
                    (!right.empty() && right.back() == '0')) {
                    continue;
                }
                
                if (right.empty()) {
                    res.push_back(left);
                } else {
                    res.push_back(left + "." + right);
                }
            }
            
            return res;
        };
        
        for (int i = 1; i < s.size(); i++) {
            vector<string> xOptions = getValidNumbers(s.substr(0, i));
            vector<string> yOptions = getValidNumbers(s.substr(i));
            
            for (const string& x : xOptions) {
                for (const string& y : yOptions) {
                    finalResults.push_back("(" + x + ", " + y + ")");
                }
            }
        }
        
        return finalResults;
    }
};
