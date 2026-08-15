class Solution {
public:
    int minStoneSum(vector<int>& piles, int k) {
        priority_queue<int> maxHeap(piles.begin(), piles.end());
        for (int i = 0; i < k; i++) {
            int x = maxHeap.top(); maxHeap.pop();
            int reduced = (x + 1) / 2;
            maxHeap.push(reduced);
        }
        int sum = 0;
        while (!maxHeap.empty()) {
            sum += maxHeap.top();
            maxHeap.pop();
        }
        return sum;
    }
};
