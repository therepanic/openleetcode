class Solution {
    public int minOperations(String[] logs) {
        int output = 0;
        for (String log : logs) {
            if (log.equals("../")) {
                output--;
                if (output < 0) output = 0;
            } else if (log.equals("./")) {
                continue;
            } else {
                output++;
            }
        }
        return output < 0 ? 0 : output;
    }
}
