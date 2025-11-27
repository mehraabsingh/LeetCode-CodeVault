class Solution {
    public long maxSubarraySum(int[] nums, int k) {
        int n = nums.length;
        long[] pref = new long[n + 1];
        for (int i = 0; i < n; i++) pref[i + 1] = pref[i] + nums[i];

        long ans = Long.MIN_VALUE;
        long[] best = new long[k];
        boolean[] seen = new boolean[k];

        for (int i = 0; i <= n; i++) {
            int r = i % k;
            if (seen[r]) ans = Math.max(ans, pref[i] - best[r]);
            if (!seen[r] || pref[i] < best[r]) {
                best[r] = pref[i];
                seen[r] = true;
            }
        }
        return ans;
    }
}
