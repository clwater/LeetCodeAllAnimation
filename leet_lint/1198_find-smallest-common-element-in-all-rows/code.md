# Find Smallest Common Element in All Rows
# 找出所有行中最小公共元素

## Description
Given a matrix mat where every row is sorted in strictly increasing order, return the smallest common element in all rows.
If there is no common element, return -1.

## Description
给你一个矩阵 mat，其中每一行的元素都已经按 递增 顺序排好了。请你帮忙找出在所有这些行中 最小的公共元素。
如果矩阵中没有这样的公共元素，就请返回 -1。

## 示例
## 示例1：
    输入：mat = [[1,2,3,4,5],[2,4,5,8,10],[3,5,7,9,11],[1,3,5,7,9]]
    输出：5
    提示：
      1 <= mat.length, mat[i].length <= 500
      1 <= mat[i][j] <= 10^4
      mat[i] 已按递增顺序排列。

## Example
### Example 1:
    Input: mat = [[1,2,3,4,5],[2,4,5,8,10],[3,5,7,9,11],[1,3,5,7,9]]
    Output: 5
    Constraints:
      1 <= mat.length, mat[i].length <= 500
      1 <= mat[i][j] <= 10^4
      mat[i] is sorted in strictly increasing order.


## Solution
### 计数+二分
每行都按照升序排列,说明每行都没有重复元素.如果一个元素出现在所有行,则该元素一定出现了n次,统计所有元素的出现次数,找出出现 n 次的最小元素.另外,也可以在矩阵中直接使用二分查找.


## Code 

```java
    //计数
    //T O(mn)
    //S O(10000) = O(1) 有约束
    //S O(k)            无约束
    public int smallestCommonElement(int[][] mat) {
        //建立相关数组
        int checks[] = new int[10001];
        //获取范围
        int row = mat.length, col = mat[0].length;

        //遍历数组
        for (int i = 0; i < row; ++i) {
            for (int j = 0; j < col; ++j) {

                //如果数组内值自加后等于行数, 则此值则是每行中都存在的最小值
                if (++checks[mat[i][j]] == row) {
                    return mat[i][j];
                }

            }
        }
        return -1;

    }

    //二分搜索
    //T O(mnlogm)
    //S O(1)
    public int smallestCommonElement(int[][] mat) {
        //获取当前数组的边界
        int row = mat.length, col = mat[0].length;

        //遍历列的情况寻找
        for (int j = 0; j < col; j++) {

            //定义当前查找情况
            boolean check = true;

            //遍历寻找不同行中 是否存在相关元素(二分查找)
            for (int i = 1; i < row && check; i++) {
                //二分查找当前是否包含元素
                check = Arrays.binarySearch(mat[i], mat[0][j]) >= 0;
            }

            //如果遍历后check值仍为true, 说明当前值再每一行都存在
            if (check) {
                return mat[0][j];
            }
        }
        return -1;
    }

```