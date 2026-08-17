using System.Collections.Generic;

public class Solution {
    public string LongestSubsequenceRepeatedK(string s, int k) {
        bool IsK(string sub, string t, int k) {
            int count = 0;
            int i = 0;
            foreach (char ch in t) {
                if (i < sub.Length && ch == sub[i]) {
                    i++;
                    if (i == sub.Length) {
                        i = 0;
                        count++;
                        if (count == k) return true;
                    }
                }
            }
            return false;
        }

        string res = "";
        Queue<string> q = new Queue<string>();
        q.Enqueue("");
        while (q.Count > 0) {
            string curr = q.Dequeue();
            for (char ch = 'a'; ch <= 'z'; ch++) {
                string nxt = curr + ch;
                if (IsK(nxt, s, k)) {
                    res = nxt;
                    q.Enqueue(nxt);
                }
            }
        }
        return res;
    }
}
