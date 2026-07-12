class Solution {
    public int[] addNegabinary(int[] arr1, int[] arr2) {
        List<Integer> res = new ArrayList<>();
        int i = arr1.length - 1, j = arr2.length - 1;
        int carry = 0;
        
        while (carry != 0 || i >= 0 || j >= 0) {
            if (i >= 0) carry += arr1[i--];
            if (j >= 0) carry += arr2[j--];
            res.add(carry & 1);
            carry = -(carry >> 1);
        }
        
        while (res.size() > 1 && res.get(res.size() - 1) == 0) {
            res.remove(res.size() - 1);
        }
        
        int[] result = new int[res.size()];
        for (int k = 0; k < res.size(); k++) {
            result[k] = res.get(res.size() - 1 - k);
        }
        return result;
    }
}
