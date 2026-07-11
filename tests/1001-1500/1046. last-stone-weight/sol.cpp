class Solution {
public:
    int lastStoneWeight(vector<int>& stones) {
        priority_queue<int> heap;
        
        for (int stone : stones) {
            heap.push(stone);
        }
        
        while (heap.size() > 1) {
            int maxStone1 = heap.top();
            heap.pop();
            int maxStone2 = heap.top();
            heap.pop();
            
            if (maxStone1 != maxStone2) {
                heap.push(maxStone1 - maxStone2);
            }
        }
        
        return heap.empty() ? 0 : heap.top();
    }
};
