# Merge Sorted Array
# 合并两个有序数组

## Description
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

## Description
给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

## Example
### Example 1:
    Input:
    nums1 = [1,2,3,0,0,0], m = 3
    nums2 = [2,5,6],       n = 3

    Output: [1,2,2,3,5,6]


## 示例
### 示例:
    输入:
    nums1 = [1,2,3,0,0,0], m = 3
    nums2 = [2,5,6],       n = 3

    输出: [1,2,2,3,5,6]

## Constraints:
-10^9 <= nums1[i], nums2[i] <= 10^9
nums1.length == m + n
nums2.length == n


## 说明:
初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。


## Solution
### 双指针
除了可以通过简单的合并排序, 我们还可以通过双指针的方法来解决

### Code

```java
    //合并后排序
    //T O((n+m) * log(m+n))
    //S O(1)
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        System.arraycopy(nums2, 0, nums1, m, n);
        Arrays.sort(nums1);
    }

    //双指针
    //T O(n + m)
    //S O(1)
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        //分别获取数组的最后一个元素
        int p1 = m - 1;
        int p2 = n - 1;
        int current = m + n - 1;

        //获取数组对应位置的元素, 将其放入最后的位置中
        while ( (p1 >= 0) && (p2 >= 0)){
            nums1[current--] = (
                    nums1[p1] < nums2[p2] ?
                            nums2[p2--]
                            :
                            nums1[p1--]
            );
        }
        //将nums2剩下的元素放入到num1中
        System.arraycopy(nums2, 0, nums1, 0, p2 + 1);
    }
```