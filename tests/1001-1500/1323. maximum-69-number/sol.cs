public class Solution {
    public int Maximum69Number (int num) {
        string s = num.ToString();
        int idx = s.IndexOf('6');
        if (idx != -1) {
            char[] arr = s.ToCharArray();
            arr[idx] = '9';
            s = new string(arr);
        }
        return int.Parse(s);
    }
}
