class Solution {
    public int maxRepOpt1(String text) {
        int[] total = new int[26];
        for (char c : text.toCharArray()) {
            total[c - 'a']++;
        }
        int n = text.length();
        int ans = 0;
        
        for (int i = 0; i < 26; i++) {
            if (total[i] == 0) continue;
            char ch = (char)(i + 'a');
            int left = 0;
            int count = 0;
            
            for (int right = 0; right < n; right++) {
                if (text.charAt(right) == ch) {
                    count++;
                }
                
                while ((right - left + 1) - count > 1) {
                    if (text.charAt(left) == ch) {
                        count--;
                    }
                    left++;
                }
                
                ans = Math.max(ans, Math.min(right - left + 1, total[i]));
            }
        }
        
        return ans;
    }
}
