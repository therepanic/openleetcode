public class Solution {
    public string MaxValue(string n, int x) {
        string xs = x.ToString();
        if (n[0] != '-') {
            for (int i = 0; i < n.Length; i++) {
                if (xs[0] > n[i]) {
                    return n.Substring(0, i) + xs + n.Substring(i);
                }
            }
            return n + xs;
        } else {
            for (int i = 1; i < n.Length; i++) {
                if (xs[0] < n[i]) {
                    return n.Substring(0, i) + xs + n.Substring(i);
                }
            }
            return n + xs;
        }
    }
}
