class Solution {
public:
    vector<int> replaceElements(vector<int>& arr) {
        int max_element = -1;
        for (int i = arr.size() - 1; i >= 0; i--) {
            int temp = arr[i];
            arr[i] = max_element;
            max_element = max(max_element, temp);
        }
        return arr;
    }
};
