class Solution {
public:
    int getMinSwaps(string num, int k) {
        string arr = num;
        string target = num;
        
        for (int i = 0; i < k; i++) {
            nextPermutation(target);
        }
        
        int swaps = 0;
        arr = num;
        
        for (int i = 0; i < arr.length(); i++) {
            if (arr[i] == target[i]) continue;
            
            int j = i;
            while (arr[j] != target[i]) j++;
            
            while (j > i) {
                swap(arr[j], arr[j - 1]);
                j--;
                swaps++;
            }
        }
        
        return swaps;
    }
    
private:
    void nextPermutation(string& arr) {
        int i = arr.length() - 2;
        while (i >= 0 && arr[i] >= arr[i + 1]) i--;
        if (i == -1) return;
        
        int j = arr.length() - 1;
        while (arr[j] <= arr[i]) j--;
        
        swap(arr[i], arr[j]);
        
        int left = i + 1, right = arr.length() - 1;
        while (left < right) {
            swap(arr[left], arr[right]);
            left++;
            right--;
        }
    }
};
