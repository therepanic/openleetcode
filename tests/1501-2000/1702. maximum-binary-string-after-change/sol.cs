public class Solution {
    public string MaximumBinaryString(string binary) {
        int n = binary.Length;
        int z = binary.Count(c => c == '0');
        
        if (z < 2) return binary;
        
        int firstZero = binary.IndexOf('0');
        int p = firstZero + z - 1;
        
        return new string('1', p) + "0" + new string('1', n - p - 1);
    }
}
