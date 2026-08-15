class Solution {
    public int numberOfWeakCharacters(int[][] properties) {
        Arrays.sort(properties, (a, b) -> a[0] != b[0] ? b[0] - a[0] : a[1] - b[1]);
        
        int maxDefense = 0;
        int weakCount = 0;
        
        for (int[] prop : properties) {
            if (prop[1] < maxDefense) {
                weakCount++;
            } else {
                maxDefense = prop[1];
            }
        }
        
        return weakCount;
    }
}
