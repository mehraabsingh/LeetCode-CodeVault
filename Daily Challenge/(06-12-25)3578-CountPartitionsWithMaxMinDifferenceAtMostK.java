import java.util.ArrayDeque;
import java.util.Deque;

class Solution {
    public int countPartitions(int[] nums, int k) {
        int n = nums.length;
        int MOD = (int) 1e9 + 7;

        int[] dp = new int[n + 1];
        dp[0] = 1;

        int[] prefix_sum = new int[n + 2];
        prefix_sum[1] = 1;

        int left = 0;
        Deque<Integer> max_dq = new ArrayDeque<>();
        Deque<Integer> min_dq = new ArrayDeque<>();

        for (int right = 0; right < n; right++) {
            while (!max_dq.isEmpty() && nums[max_dq.peekLast()] <= nums[right]) {
                max_dq.pollLast();
            }
            max_dq.offer(right);

            while (!min_dq.isEmpty() && nums[min_dq.peekLast()] >= nums[right]) {
                min_dq.pollLast();
            }
            min_dq.offer(right);

            while (nums[max_dq.peekFirst()] - nums[min_dq.peekFirst()] > k) {
                left += 1;
                if (max_dq.peekFirst() < left) {
                    max_dq.pollFirst();
                }
                if (min_dq.peekFirst() < left) {
                    min_dq.pollFirst();
                }
            }

            int current_ways = (prefix_sum[right + 1] - prefix_sum[left] + MOD) % MOD;
            dp[right + 1] = current_ways;
            prefix_sum[right + 2] = (prefix_sum[right + 1] + dp[right + 1]) % MOD;
        }

        return dp[n];
    }
}
