class Solution {
public:
    int numUniqueEmails(vector<string>& emails) {
        unordered_set<string> res;
        for (const string& email : emails) {
            size_t atIndex = email.find('@');
            string local = email.substr(0, atIndex);
            string domain = email.substr(atIndex + 1);
            
            size_t plusIndex = local.find('+');
            if (plusIndex != string::npos) {
                local = local.substr(0, plusIndex);
            }
            local.erase(remove(local.begin(), local.end(), '.'), local.end());
            res.insert(local + "@" + domain);
        }
        return res.size();
    }
};
