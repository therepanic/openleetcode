import java.util.*;

class Solution {
    public int minOperations(int[] target, int[] arr) {
        Map<Integer, Integer> targetIndexMap = new HashMap<>();
        for (int i = 0; i < target.length; i++) {
            targetIndexMap.put(target[i], i);
        }
        
        List<Integer> transformedArr = new ArrayList<>();
        for (int num : arr) {
            if (targetIndexMap.containsKey(num)) {
                transformedArr.add(targetIndexMap.get(num));
            }
        }
        
        List<Integer> lis = new ArrayList<>();
        for (int index : transformedArr) {
            int pos = Collections.binarySearch(lis, index);
            if (pos < 0) {
                pos = -pos - 1;
            }
            if (pos == lis.size()) {
                lis.add(index);
            } else {
                lis.set(pos, index);
            }
        }
        
        return target.length - lis.size();
    }
}
