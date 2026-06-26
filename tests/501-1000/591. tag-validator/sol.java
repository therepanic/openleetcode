class Solution {
    public boolean isValid(String code) {
        java.util.regex.Pattern tagPat = java.util.regex.Pattern.compile("<(/?)([A-Z]{1,9})>");
        String openCdata = "<![CDATA[";
        String closeCdata = "]]>";
        java.util.Stack<String> stack = new java.util.Stack<>();
        boolean firstTagSeen = false;
        int i = 0, j = code.length();
        
        while (i <= j) {
            int s = code.indexOf('<', i);
            if (s == -1) break;
            int e = code.indexOf('>', s + 1);
            if (e == -1) return false;
            
            String candidate = code.substring(s, e + 1);
            java.util.regex.Matcher m = tagPat.matcher(candidate);
            
            if (m.matches()) {
                String tag = m.group(2);
                
                if (m.group(1).isEmpty()) {
                    if (!firstTagSeen && s != 0) return false;
                    stack.push(tag);
                    firstTagSeen = true;
                } else {
                    if (stack.isEmpty() || !stack.peek().equals(tag)) return false;
                    if (stack.size() == 1 && e != code.length() - 1) return false;
                    stack.pop();
                }
                
                i = e + 1;
            } else if (code.startsWith(openCdata, s)) {
                int k = code.indexOf(closeCdata, s + openCdata.length());
                if (k == -1) return false;
                i = k + closeCdata.length();
            } else {
                return false;
            }
        }
        
        return stack.isEmpty() && firstTagSeen;
    }
}
