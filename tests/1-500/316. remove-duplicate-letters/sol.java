class Solution {
    public String removeDuplicateLetters(String s) {
        int[] lastOccur = new int[26];
        for (int i = 0; i < s.length(); i++) {
            lastOccur[s.charAt(i) - 'a'] = i;
        }
        
        boolean[] visited = new boolean[26];
        StringBuilder stack = new StringBuilder();
        
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (visited[c - 'a']) {
                continue;
            }
            
            while (stack.length() > 0 && c < stack.charAt(stack.length() - 1) && 
                   i < lastOccur[stack.charAt(stack.length() - 1) - 'a']) {
                visited[stack.charAt(stack.length() - 1) - 'a'] = false;
                stack.deleteCharAt(stack.length() - 1);
            }
            
            visited[c - 'a'] = true;
            stack.append(c);
        }
        
        return stack.toString();
    }
}
