public class Solution {
    public string LargestTimeFromDigits(int[] arr) {
        List<int[]> permList = new List<int[]>();
        Permute(arr, 0, permList);
        
        int bestTime = -1;
        int bestIdx = -1;
        
        for (int i = 0; i < permList.Count; i++) {
            int[] perm = permList[i];
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
        
        int[] res = permList[bestIdx];
        return $"{res[0]}{res[1]}:{res[2]}{res[3]}";
    }
    
    private void Permute(int[] arr, int start, List<int[]> result) {
        if (start == arr.Length) {
            result.Add((int[])arr.Clone());
            return;
        }
        for (int i = start; i < arr.Length; i++) {
            Swap(arr, start, i);
            Permute(arr, start + 1, result);
            Swap(arr, start, i);
        }
    }
    
    private void Swap(int[] arr, int i, int j) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}
