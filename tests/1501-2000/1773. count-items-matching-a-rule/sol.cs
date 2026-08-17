public class Solution {
    public int CountMatches(IList<IList<string>> items, string ruleKey, string ruleValue) {
        var keyMap = new Dictionary<string,int>{{"type",0},{"color",1},{"name",2}};
        int count = 0;
        int idx = keyMap[ruleKey];
        foreach(var item in items) {
            if(item[idx] == ruleValue) {
                count++;
            }
        }
        return count;
    }
}
