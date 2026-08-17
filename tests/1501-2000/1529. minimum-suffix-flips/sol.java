class Solution {
    public int minFlips(String target) {
        int minCount = 0;
        int flag = 0;
        int n = target.length();
        
        for (int i = 0; i < n; i++) {
            if (target.charAt(i) != (char)('0' + (flag % 2))) {
                minCount++;
                flag++;
            }
        }
        
        return minCount;
    }
}
