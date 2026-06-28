class Solution {
    public int subarraySum(int[] nums, int k) {
        java.util.HashMap<Integer, Integer> sub_num = new java.util.HashMap<>();
        sub_num.put(0, 1);
        int total = 0;
        int count = 0;
        
        for (int n : nums) {
            total += n;
            
            if (sub_num.containsKey(total - k)) {
                count += sub_num.get(total - k);
            }
            
            sub_num.put(total, sub_num.getOrDefault(total, 0) + 1);
        }
        
        return count;
    }
}
