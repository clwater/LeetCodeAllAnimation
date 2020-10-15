# Search a 2D Matrix II
# 搜索二维矩阵

## Description
Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
Integers in each row are sorted in ascending from left to right.
Integers in each column are sorted in ascending from top to bottom.

## Description
编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target。该矩阵具有以下特性：
每行的元素从左到右升序排列。
每列的元素从上到下升序排列。

## Example
### Example:
    Consider the following matrix:
    [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    Given target = 5, return true.
    Given target = 20, return false.

## 示例
### 示例:
    现有矩阵 matrix 如下：
    [
      [1,   4,  7, 11, 15],
      [2,   5,  8, 12, 19],
      [3,   6,  9, 16, 22],
      [10, 13, 14, 17, 24],
      [18, 21, 23, 26, 30]
    ]
    给定 target = 5，返回 true。
    给定 target = 20，返回 false。



## Solution
### 迭代
通过选取特殊点, 使得其再四个方向的属性都不相同, 依次迭代相关关系即可.


## Code 

```java
    //T O(m+n)
    //S O(1)
    public boolean searchMatrix(int[][] matrix, int target) {
        //获取数组边界
        int row = matrix.length-1;
        int col = 0;

        //判断是否仍在区间内
        while (row >= 0 && col < matrix[0].length) {
            //当前数值小大目标数值则上移
            if (matrix[row][col] > target) {
                row--;
            //当面数值小于目标数值则右移
            } else if (matrix[row][col] < target) {
                col++;
            } else {
                return true;
            }
        }

        return false;
    }
```