public class Solution {
    public int[] AddNegabinary(int[] arr1, int[] arr2) {
        var res = new List<int>();
        int i = arr1.Length - 1, j = arr2.Length - 1;
        int carry = 0;
        
        while (carry != 0 || i >= 0 || j >= 0) {
            if (i >= 0) carry += arr1[i--];
            if (j >= 0) carry += arr2[j--];
            res.Add(carry & 1);
            carry = -(carry >> 1);
        }
        
        while (res.Count > 1 && res[res.Count - 1] == 0) {
            res.RemoveAt(res.Count - 1);
        }
        
        res.Reverse();
        return res.ToArray();
    }
}
