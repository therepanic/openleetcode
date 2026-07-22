public class Solution {
    public bool CanBeEqual(int[] target, int[] arr) {
        int[] counts = new int[1001];
        
        for (int i = 0; i < target.Length; i++) {
            counts[target[i]]++;
            counts[arr[i]]--;
        }
        
        foreach (int c in counts) {
            if (c != 0) return false;
        }
        return true;
    }
}
