class Solution {
    public int binaryGap(int n) {
        int maxDist = 0;
        int currDist = 0;
        boolean foundFirstOne = false;
        
        while (n > 0) {
            int bit = n % 2;
            
            if (bit == 1) {
                if (foundFirstOne) {
                    maxDist = Math.max(maxDist, currDist);
                }
                
                currDist = 1;
                foundFirstOne = true;
            } else {
                if (foundFirstOne) {
                    currDist++;
                }
            }
            
            n /= 2;
        }
        
        return maxDist;
    }
}
