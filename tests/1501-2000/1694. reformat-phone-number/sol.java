class Solution {
    public String reformatNumber(String number) {
        String phoneCleared = number.replaceAll("\\D", "");
        StringBuilder result = new StringBuilder();
        
        while (phoneCleared.length() > 4) {
            result.append(phoneCleared.substring(0, 3)).append('-');
            phoneCleared = phoneCleared.substring(3);
        }
        
        if (phoneCleared.length() == 4) {
            result.append(phoneCleared.substring(0, 2)).append('-').append(phoneCleared.substring(2));
        } else if (!phoneCleared.isEmpty()) {
            result.append(phoneCleared);
        }
        
        return result.toString();
    }
}
