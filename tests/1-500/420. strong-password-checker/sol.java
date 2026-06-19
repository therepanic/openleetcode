import java.util.*;

class Solution {
    public int strongPasswordChecker(String password) {
        Set<Character> lowercase = new HashSet<>(Arrays.asList('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'));
        Set<Character> uppercase = new HashSet<>(Arrays.asList('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'));
        Set<Character> digit = new HashSet<>(Arrays.asList('0','1','2','3','4','5','6','7','8','9'));
        
        Set<Character> characters = new HashSet<>();
        for (char c : password.toCharArray()) {
            characters.add(c);
        }
        
        boolean needsLowercase = true;
        boolean needsUppercase = true;
        boolean needsDigit = true;
        
        for (char c : characters) {
            if (lowercase.contains(c)) needsLowercase = false;
            if (uppercase.contains(c)) needsUppercase = false;
            if (digit.contains(c)) needsDigit = false;
        }
        
        int numRequiredTypeReplaces = (needsLowercase ? 1 : 0) + (needsUppercase ? 1 : 0) + (needsDigit ? 1 : 0);
        int numRequiredInserts = Math.max(0, 6 - password.length());
        int numRequiredDeletes = Math.max(0, password.length() - 20);
        
        List<Integer> groups = new ArrayList<>();
        if (password.length() > 0) {
            int count = 1;
            for (int i = 1; i < password.length(); i++) {
                if (password.charAt(i) == password.charAt(i-1)) {
                    count++;
                } else {
                    groups.add(count);
                    count = 1;
                }
            }
            groups.add(count);
        }
        
        for (int d = 0; d < numRequiredDeletes; d++) {
            int argmin = -1;
            int minVal = Integer.MAX_VALUE;
            for (int i = 0; i < groups.size(); i++) {
                int group = groups.get(i);
                int val;
                if (group >= 3) {
                    val = group % 3;
                } else {
                    val = 10 - group;
                }
                if (val < minVal) {
                    minVal = val;
                    argmin = i;
                }
            }
            if (argmin != -1) {
                groups.set(argmin, groups.get(argmin) - 1);
            }
        }
        
        int numRequiredGroupReplaces = 0;
        for (int group : groups) {
            numRequiredGroupReplaces += group / 3;
        }
        
        return numRequiredDeletes + Math.max(numRequiredTypeReplaces, Math.max(numRequiredGroupReplaces, numRequiredInserts));
    }
}
