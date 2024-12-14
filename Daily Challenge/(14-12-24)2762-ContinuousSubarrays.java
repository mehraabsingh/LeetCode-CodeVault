class Solution {
  public long continuousSubarrays(int[] nums) {
    long ans = 1; // [nums[0]]
    int left = nums[0] - 2;
    int right = nums[0] + 2;
    int l = 0;

    
    for (int r = 1; r < nums.length; r++) {
      if (left <= nums[r] && nums[r] <= right) {
        left = Math.max(left, nums[r] - 2);
        right = Math.min(right, nums[r] + 2);
      } else {
        
        left = nums[r] - 2;
        right = nums[r] + 2;
        l = r;
        
        while (nums[r] - 2 <= nums[l] && nums[l] <= nums[r] + 2) {
          left = Math.max(left, nums[l] - 2);
          right = Math.min(right, nums[l] + 2);
          --l;
        }
        ++l;
      }
      
      ans += r - l + 1;
    }

    return ans;
  }
}
