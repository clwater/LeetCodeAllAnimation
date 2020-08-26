# Rotate Array
# 旋转数组

## Description
Given an array, rotate the array to the right by k steps, where k is non-negative.

## Description
给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

## Example
###   Example 1:
    Input: nums = [1,2,3,4,5,6,7], k = 3
    Output: [5,6,7,1,2,3,4]
    Explanation:
    rotate 1 steps to the right: [7,1,2,3,4,5,6]
    rotate 2 steps to the right: [6,7,1,2,3,4,5]
    rotate 3 steps to the right: [5,6,7,1,2,3,4]

### Example 2:
    Input: nums = [-1,-100,3,99], k = 2
    Output: [3,99,-1,-100]
    Explanation: 
    rotate 1 steps to the right: [99,-1,-100,3]
    rotate 2 steps to the right: [3,99,-1,-100]

## 示例
### 示例 1:
    输入: [1,2,3,4,5,6,7] 和 k = 3
    输出: [5,6,7,1,2,3,4]
    解释:
    向右旋转 1 步: [7,1,2,3,4,5,6]
    向右旋转 2 步: [6,7,1,2,3,4,5]
    向右旋转 3 步: [5,6,7,1,2,3,4]

### 示例 2:
    输入: [-1,-100,3,99] 和 k = 2
    输出: [3,99,-1,-100]
    解释: 
    向右旋转 1 步: [99,-1,-100,3]
    向右旋转 2 步: [3,99,-1,-100]

## Other
### Follow up:
* Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
* Could you do it in-place with O(1) extra space?

### Constraints:
* 1 <= nums.length <= 2 * 10^4
* It's guaranteed that nums[i] fits in a 32 bit-signed integer.
* k >= 0

## 其它
### 说明:
* 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
* 要求使用空间复杂度为 O(1) 的 原地 算法。


## Solution
### 数组
当我们旋转数组k次时k%n个尾部元素会被移动到头部,剩下的元素会被向后移动,所以我们可以首先将所有元素反转,然后反转前 k 个元素，再反转后面n-k个元素,就能得到想要的结果.


## Code 

```java
    //T O(n)
    //S O(1)
    //环状替换
    public void rotate(int[] nums, int k) {
        //优化移动长度
        k = k % nums.length;
        //统计处理的位置数量 避免重复统计
        int count = 0;
        //循环处理的开始位置
        int start = 0;

        while (count < nums.length) {
            //当前操作位置默认为循环处理的开始位置
            int current = start;
            //记录前一个节点的内容
            int prev = nums[start];
            do {
                //计算下一个节点的位置
                int next = (current + k) % nums.length;

                //将当前节点信息保存为下一次操作的前节点信息
                //更新当前节点信息
                int temp = nums[next];
                nums[next] = prev;
                prev = temp;
                current = next;

                count++;
            } while (start != current);
            start++;
        }
    }

    //T O(n)
    //T O(1)
    //反转
    public void rotate(int[] nums, int k) {
        //优化移动长度
        k = k % nums.length;
        //反转所有的数组
        reverse(nums, 0, nums.length - 1);
        //反转位置k之前的数组
        reverse(nums, 0, k - 1);
        //反转位置k之后的数组
        reverse(nums, k, nums.length - 1);
    }
    //双指针反转数组
    public void reverse(int[] nums, int start, int end) {
        while (start < end) {
            int temp = nums[start];
            nums[start] = nums[end];
            nums[end] = temp;
            start++;
            end--;
        }
    }
```