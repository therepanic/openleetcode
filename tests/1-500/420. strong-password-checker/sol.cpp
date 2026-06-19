#include <unordered_set>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;

class Solution {
public:
    int strongPasswordChecker(string password) {
        unordered_set<char> lowercase = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
        unordered_set<char> uppercase = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
        unordered_set<char> digit = {'0','1','2','3','4','5','6','7','8','9'};
        
        unordered_set<char> characters(password.begin(), password.end());
        
        bool needsLowercase = true;
        bool needsUppercase = true;
        bool needsDigit = true;
        
        for (char c : characters) {
            if (lowercase.count(c)) needsLowercase = false;
            if (uppercase.count(c)) needsUppercase = false;
            if (digit.count(c)) needsDigit = false;
        }
        
        int numRequiredTypeReplaces = (needsLowercase ? 1 : 0) + (needsUppercase ? 1 : 0) + (needsDigit ? 1 : 0);
        int numRequiredInserts = max(0, 6 - (int)password.length());
        int numRequiredDeletes = max(0, (int)password.length() - 20);
        
        vector<int> groups;
        if (!password.empty()) {
            int count = 1;
            for (int i = 1; i < password.length(); i++) {
                if (password[i] == password[i-1]) {
                    count++;
                } else {
                    groups.push_back(count);
                    count = 1;
                }
            }
            groups.push_back(count);
        }
        
        for (int d = 0; d < numRequiredDeletes; d++) {
            int argmin = -1;
            int minVal = 100;
            for (int i = 0; i < groups.size(); i++) {
                int group = groups[i];
                int val = (group >= 3) ? (group % 3) : (10 - group);
                if (val < minVal) {
                    minVal = val;
                    argmin = i;
                }
            }
            if (argmin != -1) {
                groups[argmin]--;
            }
        }
        
        int numRequiredGroupReplaces = 0;
        for (int group : groups) {
            numRequiredGroupReplaces += group / 3;
        }
        
        return numRequiredDeletes + max(numRequiredTypeReplaces, max(numRequiredGroupReplaces, numRequiredInserts));
    }
};
