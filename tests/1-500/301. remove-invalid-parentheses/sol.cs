public class Solution {
    public IList<string> RemoveInvalidParentheses(string s) {
        bool IsValid(string str) {
            int ctr = 0;
            foreach (char ch in str) {
                if (ch == '(') {
                    ctr++;
                } else if (ch == ')') {
                    if (ctr == 0) return false;
                    ctr--;
                }
            }
            return ctr == 0;
        }
        
        var level = new HashSet<string> { s };
        while (true) {
            var valid = level.Where(str => IsValid(str)).ToList();
            if (valid.Count > 0) return valid;
            var nextLevel = new HashSet<string>();
            foreach (var str in level) {
                for (int i = 0; i < str.Length; i++) {
                    nextLevel.Add(str.Substring(0, i) + str.Substring(i + 1));
                }
            }
            level = nextLevel;
        }
    }
}
