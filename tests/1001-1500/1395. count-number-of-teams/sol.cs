public class Solution {
    public int NumTeams(int[] rating) {
        int total = 0;
        int n = rating.Length;
        for (int j = 1; j < n - 1; j++) {
            int leftLess = 0;
            int leftGreater = 0;
            for (int i = 0; i < j; i++) {
                if (rating[i] < rating[j]) {
                    leftLess++;
                } else if (rating[i] > rating[j]) {
                    leftGreater++;
                }
            }
            
            int rightLess = 0;
            int rightGreater = 0;
            for (int k = j + 1; k < n; k++) {
                if (rating[k] < rating[j]) {
                    rightLess++;
                } else if (rating[k] > rating[j]) {
                    rightGreater++;
                }
            }
            
            total += leftLess * rightGreater + leftGreater * rightLess;
        }
        return total;
    }
}
