using System;
using System.Collections.Generic;

public class Solution {
    public int KSimilarity(string s1, string s2) {
        var queue = new Queue<string>();
        queue.Enqueue(s1);
        var seen = new HashSet<string>();
        int answ = 0;
        
        while (queue.Count > 0) {
            int size = queue.Count;
            for (int k = 0; k < size; k++) {
                string str = queue.Dequeue();
                if (str == s2) return answ;
                
                int i = 0;
                while (str[i] == s2[i]) i++;
                
                char[] arr = str.ToCharArray();
                for (int j = i + 1; j < str.Length; j++) {
                    if (str[i] == s2[j] && s2[j] != s1[j]) {
                        (arr[i], arr[j]) = (arr[j], arr[i]);
                        string newStr = new string(arr);
                        if (!seen.Contains(newStr)) {
                            seen.Add(newStr);
                            queue.Enqueue(newStr);
                        }
                        (arr[i], arr[j]) = (arr[j], arr[i]);
                    }
                }
            }
            answ++;
        }
        return answ;
    }
}
