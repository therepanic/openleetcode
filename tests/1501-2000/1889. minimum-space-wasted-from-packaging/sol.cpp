class Solution {
public:
    int minWastedSpace(vector<int>& packages, vector<vector<int>>& boxes) {
        sort(packages.begin(), packages.end());
        int n = packages.size();
        long long totalPackageSum = 0;
        for (int p : packages) totalPackageSum += p;
        
        long long minGrossArea = LLONG_MAX;
        
        for (auto& supplierBoxes : boxes) {
            sort(supplierBoxes.begin(), supplierBoxes.end());
            if (supplierBoxes.back() < packages[n - 1]) continue;
            
            long long grossArea = 0;
            int lowIdx = 0;
            
            for (int b : supplierBoxes) {
                int highIdx = upperBound(packages, b, lowIdx);
                int count = highIdx - lowIdx;
                if (count > 0) {
                    grossArea += (long long)b * count;
                    lowIdx = highIdx;
                }
                if (lowIdx == n) break;
            }
            
            minGrossArea = min(minGrossArea, grossArea);
        }
        
        if (minGrossArea == LLONG_MAX) return -1;
        return (int)((minGrossArea - totalPackageSum) % 1000000007);
    }
    
private:
    int upperBound(vector<int>& arr, int target, int lo) {
        int hi = arr.size();
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (arr[mid] <= target) lo = mid + 1;
            else hi = mid;
        }
        return lo;
    }
};
