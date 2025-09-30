class Solution {
    func triangularSum(_ nums: [Int]) -> Int {
        var arr = nums
        while arr.count > 1 {
            var newArr = [Int]()
            for i in 0..<arr.count-1 {
                newArr.append((arr[i] + arr[i+1]) % 10)
            }
            arr = newArr
        }
        return arr[0]
    }
}
