public class Solution {
    public bool IsTransformable(string s, string t) {
        char[] sc = s.ToCharArray();
        char[] tc = t.ToCharArray();
        Array.Sort(sc);
        Array.Sort(tc);
        if (new string(sc) != new string(tc)) return false;
        
        var pos = new Queue<int>[10];
        for (int i = 0; i < 10; i++) pos[i] = new Queue<int>();
        for (int i = 0; i < s.Length; i++) pos[s[i]-'0'].Enqueue(i);
            
        foreach (char tt in t) {
            int dig = tt-'0';
            int i = pos[dig].Dequeue();
            for (int ii = 0; ii < dig; ii++) {
                if (pos[ii].Count > 0 && pos[ii].Peek() < i) return false;
            }
        }
        return true;
    }
}
