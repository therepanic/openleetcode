class Solution {
public:
    vector<string> spellchecker(vector<string>& wordlist, vector<string>& queries) {
        unordered_set<string> exact(wordlist.begin(), wordlist.end());
        unordered_map<string, string> caseMap;
        unordered_map<string, string> vowelMap;
        
        for (const auto& w : wordlist) {
            string lower = toLower(w);
            string devowel = deVowel(lower);
            if (caseMap.find(lower) == caseMap.end()) {
                caseMap[lower] = w;
            }
            if (vowelMap.find(devowel) == vowelMap.end()) {
                vowelMap[devowel] = w;
            }
        }
        
        vector<string> result;
        for (const auto& q : queries) {
            if (exact.count(q)) {
                result.push_back(q);
            } else {
                string lower = toLower(q);
                string devowel = deVowel(lower);
                if (caseMap.count(lower)) {
                    result.push_back(caseMap[lower]);
                } else if (vowelMap.count(devowel)) {
                    result.push_back(vowelMap[devowel]);
                } else {
                    result.push_back("");
                }
            }
        }
        return result;
    }
    
private:
    string toLower(const string& s) {
        string result = s;
        transform(result.begin(), result.end(), result.begin(), ::tolower);
        return result;
    }
    
    string deVowel(const string& s) {
        string result;
        for (char c : s) {
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
                result += '*';
            } else {
                result += c;
            }
        }
        return result;
    }
};
