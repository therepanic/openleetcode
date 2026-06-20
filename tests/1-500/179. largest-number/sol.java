import java.util.Arrays;

class Solution {
    public String largestNumber(int[] nums) {
        String[] parts = new String[nums.length];
        for (int i = 0; i < nums.length; i++) parts[i] = String.valueOf(nums[i]);
        Arrays.sort(parts, (a, b) -> (b + a).compareTo(a + b));
        if (parts.length > 0 && parts[0].equals("0")) return "0";
        StringBuilder sb = new StringBuilder();
        for (String part : parts) sb.append(part);
        return sb.toString();
    }
}
