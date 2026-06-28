class Solution {
    public int[] asteroidCollision(int[] asteroids) {
        int[] stack = new int[asteroids.length];
        int top = -1;
        for (int a : asteroids) {
            boolean destroyed = false;
            while (top >= 0 && a < 0 && stack[top] > 0) {
                if (-a > stack[top]) {
                    top--;
                    continue;
                } else if (-a == stack[top]) {
                    top--;
                }
                destroyed = true;
                break;
            }
            if (!destroyed) {
                stack[++top] = a;
            }
        }
        int[] res = new int[top + 1];
        System.arraycopy(stack, 0, res, 0, top + 1);
        return res;
    }
}
