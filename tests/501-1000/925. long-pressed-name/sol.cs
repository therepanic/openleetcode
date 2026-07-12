public class Solution {
    public bool IsLongPressedName(string name, string typed) {
        int i = 0;
        int j = 0;
        
        while (j < typed.Length) {
            if (i < name.Length && name[i] == typed[j]) {
                i++;
                j++;
            } else if (j > 0 && typed[j] == typed[j - 1]) {
                j++;
            } else {
                return false;
            }
        }
        
        return i == name.Length;
    }
}
