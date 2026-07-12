public class Solution {
    public int BinaryGap(int n) {
        int maxDist = 0;
        int currDist = 0;
        bool foundFirstOne = false;
        
        while (n > 0) {
            int bit = n % 2;
            
            if (bit == 1) {
                if (foundFirstOne) {
                    maxDist = Math.Max(maxDist, currDist);
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
