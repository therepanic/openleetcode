class Solution {
public:
    bool isNStraightHand(vector<int>& hand, int groupSize) {
        map<int, int> hashmap;
        for (int h : hand) {
            hashmap[h]++;
        }
        
        priority_queue<int, vector<int>, greater<int>> minHeap;
        for (auto& [k, _] : hashmap) {
            minHeap.push(k);
        }
        
        while (!minHeap.empty()) {
            int first = minHeap.top();
            for (int i = first; i < first + groupSize; i++) {
                if (hashmap.find(i) == hashmap.end()) {
                    return false;
                }
                hashmap[i]--;
                if (hashmap[i] == 0) {
                    if (i != minHeap.top()) {
                        return false;
                    }
                    minHeap.pop();
                }
            }
        }
        return true;
    }
};
