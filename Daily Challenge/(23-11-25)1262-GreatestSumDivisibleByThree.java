class Solution {
  public int maxSumDivThree(int[] nums) {
    int[] dp = new int[3];
    for (int num : nums)
      for (int sum : dp.clone())
        dp[(sum + num) % 3] = Math.max(dp[(sum + num) % 3], sum + num);
    return dp[0];
  }
}
