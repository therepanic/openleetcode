class Solution {
    public String reverseOnlyLetters(String s) {
        char[] chars = s.toCharArray();
        int start = 0;
        int end = chars.length - 1;
        while (true) {
            if (start >= end) {
                break;
            }
            
            if (Character.isLetter(chars[start]) && Character.isLetter(chars[end])) {
                char temp = chars[start];
                chars[start] = chars[end];
                chars[end] = temp;
                start++;
                end--;
            } else if (!Character.isLetter(chars[start])) {
                start++;
            } else {
                end--;
            }
        }
        
        return new String(chars);
    }
}
