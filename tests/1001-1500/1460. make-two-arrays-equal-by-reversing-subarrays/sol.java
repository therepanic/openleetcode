class Solution {
    public boolean canBeEqual(int[] target, int[] arr) {
        int[] counts = new int[1001];
        
        for (int i = 0; i < target.length; i++) {
            counts[target[i]]++;
            counts[arr[i]]--;
        }
        
        for (int c : counts) {
            if (c != 0) return false;
        }
        return true;
    }
}
