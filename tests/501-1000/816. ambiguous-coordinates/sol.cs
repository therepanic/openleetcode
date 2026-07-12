public class Solution {
    public IList<string> AmbiguousCoordinates(string s) {
        s = s.Substring(1, s.Length - 2);
        List<string> finalResults = new List<string>();
        
        for (int i = 1; i < s.Length; i++) {
            List<string> xOptions = GetValidNumbers(s.Substring(0, i));
            List<string> yOptions = GetValidNumbers(s.Substring(i));
            
            foreach (string x in xOptions) {
                foreach (string y in yOptions) {
                    finalResults.Add("(" + x + ", " + y + ")");
                }
            }
        }
        
        return finalResults;
    }
    
    private List<string> GetValidNumbers(string numStr) {
        List<string> res = new List<string>();
        
        for (int i = 1; i <= numStr.Length; i++) {
            string left = numStr.Substring(0, i);
            string right = numStr.Substring(i);
            
            if ((left.Length > 1 && left.StartsWith("0")) || 
                (right.Length > 0 && right.EndsWith("0"))) {
                continue;
            }
            
            if (right.Length == 0) {
                res.Add(left);
            } else {
                res.Add(left + "." + right);
            }
        }
        
        return res;
    }
}
