package leetcode.editor.cn;

//给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。 
//
// 
// 
//
// 
//
// 示例 1： 
// 
// 
//输入：head = [4,2,1,3]
//输出：[1,2,3,4]
// 
//
// 示例 2： 
// 
// 
//输入：head = [-1,5,3,4,0]
//输出：[-1,0,3,4,5]
// 
//
// 示例 3： 
//
// 
//输入：head = []
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// 链表中节点的数目在范围 [0, 5 * 10⁴] 内 
// -10⁵ <= Node.val <= 10⁵ 
// 
//
// 
//
// 进阶：你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？ 
//
// Related Topics 链表 双指针 分治 排序 归并排序 👍 2357 👎 0

public class SortList{
	public static void main(String[] args) {
		Solution solution = new SortList().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode sortList(ListNode head) {
		if (head == null) {
			return head;
		}
		int length = 0;
		ListNode res = head;
		while (res != null) {
			length++;
			res = res.next;
		}
		res = new ListNode(0, head);
		for (int i = 1; i < length; i <<= 1) {
			ListNode p = res;
			ListNode q = res.next;
			while (q != null) {
				ListNode l1 = q;
				for (int j = 1; j < i && q != null && q.next != null; j++) {
					q = q.next;
				}

				ListNode l2 = q.next;
				q.next = null;
				q = l2;
				for (int j = 1; j < i && q != null && q.next != null; j++) {
					q = q.next;
				}

				ListNode next = null;
				if (q != null) {
					next = q.next;
					q.next = null;
				}

				p.next = b(l1, l2);
				while (p.next != null) {
					p = p.next;
				}
				q = next;
			}
		}
		return res.next;
    }

	public ListNode b(ListNode l1, ListNode l2) {
		ListNode head = new ListNode(0);
		ListNode p = l1;
		ListNode q = l2;
		ListNode res = head;
		while (p != null && q != null) {
			if (p.val < q.val) {
				res.next = p;
				p = p.next;
			} else {
				res.next = q;
				q = q.next;
			}
			res = res.next;
		}
		if (p == null) {
			res.next = q;
		}
		if (q == null) {
			res.next = p;
		}
		return head.next;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
