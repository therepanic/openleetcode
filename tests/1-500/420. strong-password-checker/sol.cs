using System;
using System.Collections.Generic;
using System.Linq;

public class Solution {
    public int StrongPasswordChecker(string password) {
        HashSet<char> lowercase = new HashSet<char>("abcdefghijklmnopqrstuvwxyz");
        HashSet<char> uppercase = new HashSet<char>("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
        HashSet<char> digit = new HashSet<char>("0123456789");
        
        HashSet<char> characters = new HashSet<char>(password);
        
        bool needsLowercase = !characters.Any(c => lowercase.Contains(c));
        bool needsUppercase = !characters.Any(c => uppercase.Contains(c));
        bool needsDigit = !characters.Any(c => digit.Contains(c));
        int numRequiredTypeReplaces = (needsLowercase ? 1 : 0) + (needsUppercase ? 1 : 0) + (needsDigit ? 1 : 0);
        
        int numRequiredInserts = Math.Max(0, 6 - password.Length);
        int numRequiredDeletes = Math.Max(0, password.Length - 20);
        
        List<int> groups = new List<int>();
        if (password.Length > 0) {
            int count = 1;
            for (int i = 1; i < password.Length; i++) {
                if (password[i] == password[i-1]) {
                    count++;
                } else {
                    groups.Add(count);
                    count = 1;
                }
            }
            groups.Add(count);
        }
        
        for (int d = 0; d < numRequiredDeletes; d++) {
            int argmin = -1;
            int minVal = int.MaxValue;
            for (int i = 0; i < groups.Count; i++) {
                int group = groups[i];
                int val = group >= 3 ? group % 3 : 10 - group;
                if (val < minVal) {
                    minVal = val;
                    argmin = i;
                }
            }
            if (argmin != -1) {
                groups[argmin]--;
            }
        }
        
        int numRequiredGroupReplaces = groups.Sum(g => g / 3);
        
        return numRequiredDeletes + Math.Max(numRequiredTypeReplaces, Math.Max(numRequiredGroupReplaces, numRequiredInserts));
    }
}
