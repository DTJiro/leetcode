package leetcode.editor.cn;

//给你一个链表数组，每个链表都已经按升序排列。 
//
// 请你将所有链表合并到一个升序链表中，返回合并后的链表。 
//
// 
//
// 示例 1： 
//
// 输入：lists = [[1,4,5],[1,3,4],[2,6]]
//输出：[1,1,2,3,4,4,5,6]
//解释：链表数组如下：
//[
//  1->4->5,
//  1->3->4,
//  2->6
//]
//将它们合并到一个有序链表中得到。
//1->1->2->3->4->4->5->6
// 
//
// 示例 2： 
//
// 输入：lists = []
//输出：[]
// 
//
// 示例 3： 
//
// 输入：lists = [[]]
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// k == lists.length 
// 0 <= k <= 10^4 
// 0 <= lists[i].length <= 500 
// -10^4 <= lists[i][j] <= 10^4 
// lists[i] 按 升序 排列 
// lists[i].length 的总和不超过 10^4 
// 
//
// Related Topics 链表 分治 堆（优先队列） 归并排序 👍 2732 👎 0

public class MergeKSortedLists{
	public static void main(String[] args) {
		Solution solution = new MergeKSortedLists().new Solution();
		
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
	public ListNode mergeKLists(ListNode[] lists) {
		if (lists.length == 0) {
			return null;
		}

		return t1(lists, 0, lists.length - 1);
	}

	public ListNode t1(ListNode[] list, int i, int j) {
		if (i == j) {
			return list[i];
		}
		int m = (i + j) >>> 1;

		return t2(t1(list, i, m), t1(list, m + 1, j));
	}

	public ListNode dg(ListNode list1,ListNode list2) {
		if (list1 == null) {
			return list2;
		}
		if (list2 == null) {
			return list1;
		}
		if (list1.val <= list2.val) {
			list1.next = dg(list1.next, list2);
			return list1;
		} else {
			list2.next = dg(list1, list2.next);
			return list2;
		}
	}

	public ListNode t2(ListNode list1,ListNode list2) {
		ListNode q = new ListNode();
		ListNode p = q;
		while (list1 != null && list2 != null) {
			if (list1.val <= list2.val) {
				p.next = list1;
				list1 = list1.next;
			} else {
				p.next = list2;
				list2 = list2.next;
			}
			p = p.next;
		}
		if (list1 != null) {
			p.next = list1;
		}
		if (list2 != null) {
			p.next = list2;
		}
		return q.next;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
