class Solution {
    public int maxDiff(int num) {
        String text = Integer.toString(num);

        char maxDigit = 0;
        for (int i = 0; i < text.length(); i++) {
            if (text.charAt(i) != '9') {
                maxDigit = text.charAt(i);
                break;
            }
        }
        String high = maxDigit == 0 ? text : text.replace(maxDigit, '9');

        String low;
        if (text.charAt(0) != '1') {
            low = text.replace(text.charAt(0), '1');
        } else {
            char lowDigit = 0;
            for (int i = 1; i < text.length(); i++) {
                char digit = text.charAt(i);
                if (digit != '0' && digit != '1') {
                    lowDigit = digit;
                    break;
                }
            }
            low = lowDigit == 0 ? text : text.replace(lowDigit, '0');
        }

        return Integer.parseInt(high) - Integer.parseInt(low);
    }
}
