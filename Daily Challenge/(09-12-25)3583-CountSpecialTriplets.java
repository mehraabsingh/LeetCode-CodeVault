class Solution {
    public int specialTriplets(int[] nums) {
        int n = nums.length;
        int MOD = 1_000_000_007;

        int max = 100000;
        long[] right = new long[max + 1];
        long[] left = new long[max + 1];

        for (int x : nums) right[x]++;

        long ans = 0;

        for (int j = 0; j < n; j++) {
            int x = nums[j];
            right[x]--;

            if (x * 2 <= max) {
                ans = (ans + left[x * 2] * right[x * 2]) % MOD;
            }

            left[x]++;
        }

        return (int) ans;
    }
}
