public class Solution {
    public bool IsValid(string code) {
        var tagPat = new System.Text.RegularExpressions.Regex(@"^<(/?)([A-Z]{1,9})>$");
        string openCdata = "<![CDATA[";
        string closeCdata = "]]>";
        var stack = new System.Collections.Generic.Stack<string>();
        bool firstTagSeen = false;
        int i = 0;
        int j = code.Length;
        
        while (i <= j) {
            int s = code.IndexOf('<', i);
            if (s == -1) break;
            int e = code.IndexOf('>', s + 1);
            if (e == -1) return false;
            
            string candidate = code.Substring(s, e - s + 1);
            var m = tagPat.Match(candidate);
            
            if (m.Success) {
                string tag = m.Groups[2].Value;
                string slash = m.Groups[1].Value;
                
                if (string.IsNullOrEmpty(slash)) {
                    if (!firstTagSeen && s != 0) return false;
                    stack.Push(tag);
                    firstTagSeen = true;
                } else {
                    if (stack.Count == 0 || stack.Peek() != tag) return false;
                    if (stack.Count == 1 && e != code.Length - 1) return false;
                    stack.Pop();
                }
                
                i = e + 1;
            } else if (code.Substring(s).StartsWith(openCdata)) {
                int k = code.IndexOf(closeCdata, s + openCdata.Length);
                if (k == -1) return false;
                i = k + closeCdata.Length;
            } else {
                return false;
            }
        }
        
        return stack.Count == 0 && firstTagSeen;
    }
}
