from bisect import bisect_right


class Solution:
    def minWastedSpace(self, packages: List[int], boxes: List[List[int]]) -> int:
        packages.sort()
        n = len(packages)

        # 1. Global Signal Integral (Ground Truth Energy)
        # sum(packages) is a constant we subtract at the very end.
        total_package_sum = sum(packages)

        # 2. Pre-calculating Prefix Sums for O(1) range queries
        # (Though in our 'Gross Area' version, we only need the total_sum)

        min_gross_area = float("inf")

        for supplier_boxes in boxes:
            supplier_boxes.sort()  # Sorting L elements

            if supplier_boxes[-1] < packages[-1]:
                continue

            gross_area = 0
            low_idx = 0

            # 3. Heaviside Integration (The 'Vectorized' Loop)
            for b in supplier_boxes:
                # Binary search for the 'Activation Point'
                high_idx = bisect_right(packages, b, lo=low_idx)

                count = high_idx - low_idx
                if count > 0:
                    gross_area += b * count
                    low_idx = high_idx

                if low_idx == n:
                    break

            min_gross_area = min(min_gross_area, gross_area)

        if min_gross_area == float("inf"):
            return -1

        # 4. Final L1 Loss calculation: (Min Gross Area - Total Signal Energy)
        return (min_gross_area - total_package_sum) % (10**9 + 7)
