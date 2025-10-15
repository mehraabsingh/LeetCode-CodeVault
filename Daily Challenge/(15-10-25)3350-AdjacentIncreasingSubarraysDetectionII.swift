class Solution {
    func maxIncreasingSubarrays(_ nums: [Int]) -> Int {
        var ans = 0
        var increasing = 1
        var prevIncreasing = 0

        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                increasing += 1
            } else {
                prevIncreasing = increasing
                increasing = 1
            }
            ans = max(ans, increasing / 2)
            ans = max(ans, min(prevIncreasing, increasing))
        }

        return ans
    }
}
