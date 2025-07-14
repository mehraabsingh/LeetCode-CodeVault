class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var result = 0
        var current = head
        while current != nil {
            result = result * 2 + current!.val
            current = current!.next
        }
        return result
    }
}
