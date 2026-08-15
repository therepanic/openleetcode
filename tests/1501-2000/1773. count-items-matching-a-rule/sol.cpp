class Solution {
public:
    int countMatches(vector<vector<string>>& items, string ruleKey, string ruleValue) {
        unordered_map<string,int> key_map = {{"type",0},{"color",1},{"name",2}};
        int count = 0;
        int idx = key_map[ruleKey];
        for(auto& item : items){
            if(item[idx] == ruleValue){
                count++;
            }
        }
        return count;
    }
};
