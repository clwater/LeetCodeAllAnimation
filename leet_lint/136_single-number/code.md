# Single Number
# 只出现一次的数字

## Description
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

## Description
给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

## Example
### Example 1:
    Input: [2,2,1]
    Output: 1

### Example 2:
    Input: [4,1,2,1,2]
    Output: 4

## 示例
### 示例 1:
    输入: [2,2,1]
    输出: 1

### 示例 2:
    输入: [4,1,2,1,2]
    输出: 4

## Other
### Note:
* Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

## 其它
### 说明：
你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？


## Solution
### 位运算
如果没有时间复杂度和空间复杂度的限制,这道题有很多种解法, 这里使用位运算，使用异或运算⊕, 利用异或运算的特性来处理.


## Code 

```java
    //T O(n)
    //S O(1)
    public int singleNumber(int[] nums) {
        //返回结果
        int result = 0;

        //遍历数组
        for (int num : nums) {
            //进行异或操作
            result = result ^ num;
        }
        return result;

    }
```