class Solution {
    public String getHappyString(int n, int k) {
        int total = 3 * (1 << (n - 1));
        if (k > total) {
            return "";
        }
        
        k -= 1;
        StringBuilder result = new StringBuilder();
        char last = '\0';
        
        for (int pos = 0; pos < n; pos++) {
            int branch = 1 << (n - pos - 1);
            char[] choices = new char[last == '\0' ? 3 : 2];
            int idx = 0;
            for (char c = 'a'; c <= 'c'; c++) {
                if (c != last) {
                    choices[idx++] = c;
                }
            }
            
            int choiceIdx = k / branch;
            result.append(choices[choiceIdx]);
            
            last = choices[choiceIdx];
            k %= branch;
        }
        
        return result.toString();
    }
}
