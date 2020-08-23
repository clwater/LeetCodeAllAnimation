# Squares of a Sorted Array
# 有序数组的平方

## Description
Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.

## Description
给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。


## Example
### Example 1:
    Input: [-4,-1,0,3,10]
    Output: [0,1,9,16,100]

### Example 2:
    Input: [-7,-3,2,3,11]
    Output: [4,9,9,49,121]


## 样例
### 示例 1：
    输入：[-4,-1,0,3,10]
    输出：[0,1,9,16,100]

### 示例 2：
    输入：[-7,-3,2,3,11]
    输出：[4,9,9,49,121]


## Note
* 1 <= A.length <= 10000
* -10000 <= A[i] <= 10000
* A is sorted in non-decreasing order.   

## 注意
* 1 <= A.length <= 10000
* -10000 <= A[i] <= 10000
* A 已按非递减顺序排序。

## Solution
### 排序+双指针
这道题目我们同样可以可以使用排序的方法来解决, 在此之外还可以使用双指针来解决



### Code

```java
    //排序
    //T O(n * log(n))
    //S O(n)
    public int[] sortedSquares(int[] A) {
        int N = A.length;
        int[] result = new int[N];
        for (int i = 0; i < N; ++i) {
            result[i] = A[i] * A[i];
        }

        Arrays.sort(result);
        return result;
    }


    //双指针
    //T O(n)
    //S O(n)
    public int[] sortedSquares(int[] A) {
        int[] result = new int[A.length];
        int start = 0;
        int end = A.length - 1;
        int length = A.length - 1;

        while (start <= end) {
            if (A[start] + A[end] < 0) {
                result[length--] = A[start] * A[start];
                start++;
            } else {
                result[length--] = A[end] * A[end];
                end--;
            }
        }
        return result;
    }
```