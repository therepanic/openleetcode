public class Solution {
    public int[] Decode(int[] encoded, int first) {
        int[] arr = new int[encoded.Length + 1];
        arr[0] = first;
        for (int i = 0; i < encoded.Length; i++) {
            arr[i+1] = arr[i] ^ encoded[i];
        }
        return arr;
    }
}
