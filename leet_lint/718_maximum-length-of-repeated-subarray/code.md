# Maximum Length of Repeated Subarray
# 最长重复子数组


## Description
Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.

## Description
给两个整数数组 A 和 B ，返回两个数组中公共的、长度最长的子数组的长度。


## Example
### Example 1:
    Input:
    A: [1,2,3,2,1]
    B: [3,2,1,4,7]
    Output: 3
    Explanation: 
    The repeated subarray with maximum length is [3, 2, 1].


## 示例
### 示例：
    输入：
    A: [1,2,3,2,1]
    B: [3,2,1,4,7]
    输出：3
    解释：
    长度最长的公共子数组是 [3, 2, 1] 。

## Note:
* 1 <= len(A), len(B) <= 1000
* 0 <= A[i], B[i] < 100

## 注意:
* 1 <= len(A), len(B) <= 1000
* 0 <= A[i], B[i] < 100

## Solution

### 滑动窗口
这里我们尝试不断的移动窗口, 根据当前对齐的情况尝试寻找可能的最大重复字串.

### Code

```java
  //T O((m+n) * min(m, n))
    //S O(1)
    public int findLength(int[] A, int[] B) {
        return A.length < B.length
                ?
                findLengthHelper(A, B)
                :
                findLengthHelper(B, A);
    }

    private int findLengthHelper(int[] A, int[] B) {
        //获取两个数组的长度
        int aLength = A.length, bLength = B.length;
        //计算需要
        int maxLength = 0;
        for (int i = 0; i < aLength + bLength - 1; i++) {
            //a子串开始的位置
            int aStart;
            //b子串开始的位置
            int bStart;
            //重叠的长度
            int len;
            //根据当前情况更新ab子串的起始位置及重叠长度
            if (i < aLength) {
                aStart = aLength - i - 1;
                bStart = 0;
                len = i + 1;
            } else {
                aStart = 0;
                bStart = i - aLength + 1;
                len = Math.min(bLength - bStart, aLength);
            }
            //活动当前情况下最长的重复字串
            maxLength = Math.max(maxLength, maxLength(A, B, aStart, bStart, len));
        }
        return maxLength;
    }

    //计算窗口内最大的重复子串
    private int maxLength(int[] A, int[] B, int aStart, int bStart, int len) {
        int maxLength = 0, count = 0;
        for (int i = 0; i < len; i++) {
            if (A[aStart + i] == B[bStart + i]) {
                count++;
                maxLength = Math.max(maxLength, count);
            } else {
                count = 0;
            }
        }
        return maxLength;
    }

```