class Solution {
    public String largestTimeFromDigits(int[] arr) {
        List<int[]> permList = new ArrayList<>();
        permute(arr, 0, permList);
        
        int bestTime = -1;
        int bestIdx = -1;
        
        for (int i = 0; i < permList.size(); i++) {
            int[] perm = permList.get(i);
            int hours = perm[0] * 10 + perm[1];
            int minutes = perm[2] * 10 + perm[3];
            
            if (hours < 24 && minutes < 60) {
                int currTime = hours * 60 + minutes;
                if (currTime > bestTime) {
                    bestTime = currTime;
                    bestIdx = i;
                }
            }
        }
        
        if (bestIdx == -1) return "";
        
        int[] res = permList.get(bestIdx);
        return "" + res[0] + res[1] + ":" + res[2] + res[3];
    }
    
    private void permute(int[] arr, int start, List<int[]> result) {
        if (start == arr.length) {
            result.add(arr.clone());
            return;
        }
        for (int i = start; i < arr.length; i++) {
            swap(arr, start, i);
            permute(arr, start + 1, result);
            swap(arr, start, i);
        }
    }
    
    private void swap(int[] arr, int i, int j) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}
