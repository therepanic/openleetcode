class Solution:
    def maxSatisfied(
        self, customers: List[int], grumpy: List[int], minutes: int
    ) -> int:
        n = len(customers)

        # 1. Steady-State Flux (Calculated in one pass)
        # Total = Already satisfied + Potential gain from the first window
        total_satisfied = 0
        current_window_gain = 0

        for i in range(n):
            if not grumpy[i]:
                total_satisfied += customers[i]
            elif i < minutes:
                current_window_gain += customers[i]

        # 2. Sliding Window Integral
        max_window_gain = current_window_gain

        for i in range(minutes, n):
            # If the entering element is 'Grumpy', it's a gain
            if grumpy[i]:
                current_window_gain += customers[i]
            # If the exiting element was 'Grumpy', we lose that gain
            if grumpy[i - minutes]:
                current_window_gain -= customers[i - minutes]

            if current_window_gain > max_window_gain:
                max_window_gain = current_window_gain

        return total_satisfied + max_window_gain
