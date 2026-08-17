class Solution {
public:
    int findLengthOfShortestSubarray(vector<int>& arr) {
        int n = arr.size();
        int right = n - 1;
        while (right > 0 && arr[right - 1] <= arr[right]) {
            right--;
        }
        if (right == 0) return 0;
        int answer = right;
        int left = 0;
        while (left == 0 || (left < n && arr[left - 1] <= arr[left])) {
            while (right < n && arr[left] > arr[right]) {
                right++;
            }
            answer = min(answer, right - left - 1);
            left++;
            if (left >= n) break;
        }
        return answer;
    }
};
