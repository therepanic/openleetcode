class Solution {
  int countMatches(List<List<String>> items, String ruleKey, String ruleValue) {
    var keyMap = {'type':0,'color':1,'name':2};
    var count = 0;
    var idx = keyMap[ruleKey]!;
    for (var item in items) {
      if (item[idx] == ruleValue) {
        count++;
      }
    }
    return count;
  }
}
