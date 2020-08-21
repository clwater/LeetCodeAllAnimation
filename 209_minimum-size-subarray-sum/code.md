# Minimum Size Subarray Sum
# 长度最小的子数组


## Description
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

## Description
给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的 连续 子数组，并返回其长度。如果不存在符合条件的子数组，返回 0。

 

## Example
### Example: 
    Input: s = 7, nums = [2,3,1,2,4,3]
    Output: 2
    Explanation: the subarray [4,3] has the minimal length under the problem constraint.


## 示例
### 示例：
    输入：s = 7, nums = [2,3,1,2,4,3]
    输出：2
    解释：子数组 [4,3] 是该条件下的长度最小的子数组。

## Follow up:
If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n). 

## 进阶：
如果你已经完成了 O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。

## Solution
### 双指针+滑动窗口
这里我们可以采用双指针来实现一个滑动窗口, 我们尝试加入右侧的信息查看是否到达期望, 然后再依次尝试移动左侧的区间查看是否仍然在期望中.


### Code

```java
    //T O(n)
    //S O(1)
    public int minSubArrayLen(int s, int[] nums) {
        if (nums.length == 0) {
            return 0;
        }

        //定义返回的结果(默认值为最大值)
        int result = Integer.MAX_VALUE;
        //定义开始和结束位置
        int start = 0, end = 0;

        int sum = 0;

        //遍历数组信息
        while (end < nums.length) {
            //当前位置加入到sum中
            sum += nums[end];
            //如果当前结果大于目标值, 则尝试移动开始位置, 直到区间值小于目标值
            while (sum >= s) {
                result = Math.min(result, end - start + 1);
                sum -= nums[start];
                start++;
            }
            end++;
        }

        //如果当前结果认为最大值, 则认为不存在
        return result == Integer.MAX_VALUE ? 0 : result;
    }
```