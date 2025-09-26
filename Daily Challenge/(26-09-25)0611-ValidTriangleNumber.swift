class Solution {
    func triangleNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        if n < 3 { return 0 }
        
        let nums = nums.sorted()
        var count = 0
        
        for k in stride(from: n-1, through: 2, by: -1) {
            var i = 0
            var j = k - 1
            while i < j {
                if nums[i] + nums[j] > nums[k] {
                    count += (j - i)
                    j -= 1
                } else {
                    i += 1
                }
            }
        }
        
        return count
    }
}
