public class Solution {
    public string GetHappyString(int n, int k) {
        int total = 3 * (1 << (n - 1));
        if (k > total) {
            return "";
        }
        
        k -= 1;
        char[] result = new char[n];
        char last = '\0';
        
        for (int pos = 0; pos < n; pos++) {
            int branch = 1 << (n - pos - 1);
            List<char> choices = new List<char>();
            foreach (char c in "abc") {
                if (c != last) {
                    choices.Add(c);
                }
            }
            
            int idx = k / branch;
            result[pos] = choices[idx];
            
            last = choices[idx];
            k %= branch;
        }
        
        return new string(result);
    }
}
