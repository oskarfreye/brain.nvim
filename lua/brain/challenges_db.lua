-- Built-in challenge templates
local M = {}

M.challenges = {
  {
    name = "LRU Cache",
    difficulty = "medium",
    stub = [==[
/**
 * LRU Cache
 *
 * Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
 *
 * Implement the LRUCache class:
 * - LRUCache(capacity: number) — Initialize the cache with positive size capacity.
 * - get(key: number): number — Return the value of the key if it exists, otherwise return -1.
 * - put(key: number, value: number): void — Update or insert the value. When the cache reaches
 *   capacity, evict the least recently used key before inserting a new item.
 *
 * Both get and put must run in O(1) average time complexity.
 */

export class LRUCache {
  constructor(capacity: number) {
    // YOUR CODE HERE
  }

  get(key: number): number {
    // YOUR CODE HERE
    return -1;
  }

  put(key: number, value: number): void {
    // YOUR CODE HERE
  }
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { LRUCache } from './challenge';

describe('LRU Cache', () => {
  it('basic get and put', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    expect(cache.get(1)).toBe(1);
  });

  it('evicts least recently used', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(3, 3);
    expect(cache.get(2)).toBe(-1);
  });

  it('get refreshes usage', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.get(1);
    cache.put(3, 3);
    expect(cache.get(1)).toBe(1);
    expect(cache.get(2)).toBe(-1);
  });

  it('updates existing key', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(1, 10);
    expect(cache.get(1)).toBe(10);
  });

  it('returns -1 for missing keys', () => {
    const cache = new LRUCache(1);
    expect(cache.get(99)).toBe(-1);
  });

  it('capacity of 1', () => {
    const cache = new LRUCache(1);
    cache.put(1, 1);
    cache.put(2, 2);
    expect(cache.get(1)).toBe(-1);
    expect(cache.get(2)).toBe(2);
  });

  it('many operations', () => {
    const cache = new LRUCache(3);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(3, 3);
    cache.put(4, 4);
    expect(cache.get(1)).toBe(-1);
    expect(cache.get(2)).toBe(2);
    expect(cache.get(3)).toBe(3);
    expect(cache.get(4)).toBe(4);
  });

  it('put refreshes usage', () => {
    const cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    cache.put(1, 10);
    cache.put(3, 3);
    expect(cache.get(1)).toBe(10);
    expect(cache.get(2)).toBe(-1);
  });

  it('stress test', () => {
    const cache = new LRUCache(10);
    for (let i = 0; i < 100; i++) {
      cache.put(i, i * 2);
    }
    for (let i = 0; i < 90; i++) {
      expect(cache.get(i)).toBe(-1);
    }
    for (let i = 90; i < 100; i++) {
      expect(cache.get(i)).toBe(i * 2);
    }
  });
});
]==],
  },
  {
    name = "N-Queens Solver",
    difficulty = "hard",
    stub = [==[
/**
 * N-Queens Solver
 *
 * Implement the classic N-Queens backtracking problem.
 *
 * The N-Queens puzzle asks: place N queens on an N×N chessboard
 * such that no two queens attack each other.
 *
 * Queens can attack horizontally, vertically, and diagonally.
 *
 * Implement:
 * - solveNQueens(n: number): string[][][]
 *   Return all distinct solutions. Each solution is a 2D board
 *   where 'Q' represents a queen and '.' is empty.
 *
 * - countNQueens(n: number): number
 *   Return just the count of distinct solutions (more efficient).
 *
 * - solveNQueensOptimized(n: number): number[][]
 *   Return solutions as arrays of column positions (more compact).
 *   Example: [1, 3, 0, 2] means queen in row 0 is at col 1,
 *   row 1 at col 3, row 2 at col 0, row 3 at col 2.
 *
 * Constraints: 1 <= n <= 15
 *
 * Bonus: Implement solveNQueensWithSymmetry that only finds unique
 * solutions up to rotation/reflection.
 */

export function solveNQueens(n: number): string[][][] {
  // YOUR CODE HERE
  return [];
}

export function countNQueens(n: number): number {
  // YOUR CODE HERE
  return 0;
}

export function solveNQueensOptimized(n: number): number[][] {
  // YOUR CODE HERE
  return [];
}
]==],
    tests = [==[
import { describe, it, expect } from 'vitest';
import { solveNQueens, countNQueens, solveNQueensOptimized } from './challenge';

function isValidBoard(board: string[][]): boolean {
  const n = board.length;
  const queens: [number, number][] = [];
  
  for (let r = 0; r < n; r++) {
    for (let c = 0; c < n; c++) {
      if (board[r][c] === 'Q') {
        queens.push([r, c]);
      }
    }
  }
  
  if (queens.length !== n) return false;
  
  for (let i = 0; i < queens.length; i++) {
    for (let j = i + 1; j < queens.length; j++) {
      const [r1, c1] = queens[i];
      const [r2, c2] = queens[j];
      
      // Same row or column
      if (r1 === r2 || c1 === c2) return false;
      
      // Same diagonal
      if (Math.abs(r1 - r2) === Math.abs(c1 - c2)) return false;
    }
  }
  
  return true;
}

describe('solveNQueens', () => {
  it('n=1 has one solution', () => {
    const solutions = solveNQueens(1);
    expect(solutions).toHaveLength(1);
    expect(solutions[0]).toEqual([['Q']]);
  });

  it('n=2 has no solutions', () => {
    expect(solveNQueens(2)).toEqual([]);
  });

  it('n=3 has no solutions', () => {
    expect(solveNQueens(3)).toEqual([]);
  });

  it('n=4 has 2 solutions', () => {
    const solutions = solveNQueens(4);
    expect(solutions).toHaveLength(2);
    solutions.forEach(sol => expect(isValidBoard(sol)).toBe(true));
  });

  it('n=4 solutions are valid', () => {
    const solutions = solveNQueens(4);
    solutions.forEach(sol => {
      expect(sol).toHaveLength(4);
      sol.forEach(row => expect(row).toHaveLength(4));
      const qCount = sol.flat().filter(c => c === 'Q').length;
      expect(qCount).toBe(4);
    });
  });

  it('n=5 has 10 solutions', () => {
    const solutions = solveNQueens(5);
    expect(solutions).toHaveLength(10);
    solutions.forEach(sol => expect(isValidBoard(sol)).toBe(true));
  });

  it('n=8 has 92 solutions', () => {
    const solutions = solveNQueens(8);
    expect(solutions).toHaveLength(92);
  });

  it('all solutions have correct format', () => {
    const solutions = solveNQueens(4);
    solutions.forEach(sol => {
      sol.forEach(row => {
        row.forEach(cell => {
          expect(cell).toMatch(/^[Q.]$/);
        });
      });
    });
  });
});

describe('countNQueens', () => {
  it('n=1 count is 1', () => {
    expect(countNQueens(1)).toBe(1);
  });

  it('n=2 count is 0', () => {
    expect(countNQueens(2)).toBe(0);
  });

  it('n=3 count is 0', () => {
    expect(countNQueens(3)).toBe(0);
  });

  it('n=4 count is 2', () => {
    expect(countNQueens(4)).toBe(2);
  });

  it('n=5 count is 10', () => {
    expect(countNQueens(5)).toBe(10);
  });

  it('n=6 count is 4', () => {
    expect(countNQueens(6)).toBe(4);
  });

  it('n=7 count is 40', () => {
    expect(countNQueens(7)).toBe(40);
  });

  it('n=8 count is 92', () => {
    expect(countNQueens(8)).toBe(92);
  });

  it('n=9 count is 352', () => {
    expect(countNQueens(9)).toBe(352);
  });

  it('n=10 count is 724', () => {
    expect(countNQueens(10)).toBe(724);
  });

  it('count matches solveNQueens length', () => {
    for (let n = 1; n <= 8; n++) {
      expect(countNQueens(n)).toBe(solveNQueens(n).length);
    }
  });
});

describe('solveNQueensOptimized', () => {
  it('n=1 returns [[0]]', () => {
    expect(solveNQueensOptimized(1)).toEqual([[0]]);
  });

  it('n=4 returns 2 solutions', () => {
    const solutions = solveNQueensOptimized(4);
    expect(solutions).toHaveLength(2);
    // Solutions should be column positions
    expect(solutions[0]).toHaveLength(4);
    expect(solutions[1]).toHaveLength(4);
  });

  it('n=4 solutions are valid', () => {
    const solutions = solveNQueensOptimized(4);
    solutions.forEach(sol => {
      // Check each row has exactly one queen
      expect(sol).toHaveLength(4);
      // Check all columns are unique
      const uniqueCols = new Set(sol);
      expect(uniqueCols.size).toBe(4);
      // Check no diagonal attacks
      for (let i = 0; i < sol.length; i++) {
        for (let j = i + 1; j < sol.length; j++) {
          expect(Math.abs(sol[i] - sol[j])).not.toBe(j - i);
        }
      }
    });
  });

  it('n=8 returns 92 solutions', () => {
    expect(solveNQueensOptimized(8)).toHaveLength(92);
  });

  it('optimized matches regular solutions count', () => {
    for (let n = 1; n <= 8; n++) {
      expect(solveNQueensOptimized(n).length).toBe(countNQueens(n));
    }
  });
});

describe('edge cases', () => {
  it('n=0 returns empty', () => {
    expect(solveNQueens(0)).toEqual([]);
    expect(countNQueens(0)).toBe(0);
  });

  it('negative n returns empty', () => {
    expect(solveNQueens(-1)).toEqual([]);
  });
});

describe('performance', () => {
  it('n=12 completes in reasonable time', () => {
    const start = Date.now();
    const count = countNQueens(12);
    const elapsed = Date.now() - start;
    expect(count).toBe(14200);
    expect(elapsed).toBeLessThan(10000);
  });

  it('n=13 completes', () => {
    const count = countNQueens(13);
    expect(count).toBe(73712);
  });

  it('n=14 completes', () => {
    const count = countNQueens(14);
    expect(count).toBe(365596);
  });
});
]==],
  },
  {
    name = "Throttle and Debounce",
    difficulty = "medium",
    stub = [==[
/**
 * Throttle and Debounce
 *
 * Implement rate-limiting higher-order functions commonly used in event handling.
 *
 * Throttle: Ensure a function is called at most once every `wait` milliseconds.
 * - If called multiple times within the window, only the first invocation executes.
 * - Subsequent calls are ignored until the window passes.
 * - Use case: scroll handlers, resize events, API rate limiting.
 *
 * Debounce: Delay function execution until after `wait` milliseconds of inactivity.
 * - If called again before the timer expires, reset the timer.
 * - Only executes after the caller stops invoking it for the full duration.
 * - Use case: search input, form validation, window resize.
 *
 * Implement:
 * - throttle<T extends (...args: any[]) => any>(fn: T, wait: number): T
 * - debounce<T extends (...args: any[]) => any>(fn: T, wait: number): T
 * - debounceWithImmediate<T extends (...args: any[]) => any>(fn: T, wait: number): T
 *   (executes immediately on first call, then debounces subsequent calls)
 *
 * Bonus: Add options object support:
 * - throttle(fn, wait, { leading?: boolean, trailing?: boolean })
 * - debounce(fn, wait, { immediate?: boolean })
 */

export function throttle<T extends (...args: any[]) => any>(
  fn: T,
  wait: number
): T {
  // YOUR CODE HERE
  return (() => {}) as T;
}

export function debounce<T extends (...args: any[]) => any>(
  fn: T,
  wait: number
): T {
  // YOUR CODE HERE
  return (() => {}) as T;
}

export function debounceWithImmediate<T extends (...args: any[]) => any>(
  fn: T,
  wait: number
): T {
  // YOUR CODE HERE
  return (() => {}) as T;
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { throttle, debounce, debounceWithImmediate } from './challenge';

describe('throttle', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('calls function immediately on first invocation', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('ignores calls within the wait window', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('allows call after wait period', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled();
    vi.advanceTimersByTime(100);
    throttled();
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('passes arguments correctly', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 100);
    throttled(1, 2, 3);
    expect(fn).toHaveBeenCalledWith(1, 2, 3);
  });

  it('preserves this context', () => {
    const obj = {
      value: 42,
      method: function() { return this.value; }
    };
    const throttled = throttle(obj.method, 100);
    expect(throttled.call(obj)).toBe(42);
  });

  it('returns value from function', () => {
    const fn = vi.fn(() => 'result');
    const throttled = throttle(fn, 100);
    expect(throttled()).toBe('result');
  });

  it('multiple throttled functions are independent', () => {
    const fn1 = vi.fn();
    const fn2 = vi.fn();
    const t1 = throttle(fn1, 100);
    const t2 = throttle(fn2, 100);
    t1();
    t2();
    t1();
    expect(fn1).toHaveBeenCalledTimes(1);
    expect(fn2).toHaveBeenCalledTimes(1);
  });

  it('works with different wait times', () => {
    const fn = vi.fn();
    const t50 = throttle(fn, 50);
    const t200 = throttle(fn, 200);
    t50();
    vi.advanceTimersByTime(50);
    t50();
    t200();
    vi.advanceTimersByTime(150);
    t200();
    expect(fn).toHaveBeenCalledTimes(3);
  });
});

describe('debounce', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('does not call function immediately', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    expect(fn).not.toHaveBeenCalled();
  });

  it('calls function after wait period of inactivity', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('resets timer on subsequent calls', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(50);
    debounced();
    vi.advanceTimersByTime(50);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('passes arguments from last call', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced('first');
    debounced('second');
    debounced('third');
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledWith('third');
  });

  it('preserves this context', () => {
    const obj = {
      value: 42,
      method: function() { return this.value; }
    };
    const debounced = debounce(obj.method, 100);
    debounced.call(obj);
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('returns value from function', () => {
    const fn = vi.fn(() => 'result');
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveReturnedWith('result');
  });

  it('multiple debounced functions are independent', () => {
    const fn1 = vi.fn();
    const fn2 = vi.fn();
    const d1 = debounce(fn1, 100);
    const d2 = debounce(fn2, 100);
    d1();
    d2();
    vi.advanceTimersByTime(100);
    expect(fn1).toHaveBeenCalledTimes(1);
    expect(fn2).toHaveBeenCalledTimes(1);
  });

  it('can be called multiple times after execution', () => {
    const fn = vi.fn();
    const debounced = debounce(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    debounced();
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(2);
  });
});

describe('debounceWithImmediate', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('calls function immediately on first invocation', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('ignores calls within wait period', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced();
    debounced();
    debounced();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('allows call after wait period', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced();
    vi.advanceTimersByTime(100);
    debounced();
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('passes arguments correctly', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced(1, 2, 3);
    expect(fn).toHaveBeenCalledWith(1, 2, 3);
  });

  it('preserves this context', () => {
    const obj = {
      value: 42,
      method: function() { return this.value; }
    };
    const debounced = debounceWithImmediate(obj.method, 100);
    expect(debounced.call(obj)).toBe(42);
  });

  it('returns value from function', () => {
    const fn = vi.fn(() => 'result');
    const debounced = debounceWithImmediate(fn, 100);
    expect(debounced()).toBe('result');
  });

  it('works with rapid calls', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    for (let i = 0; i < 10; i++) {
      debounced(i);
    }
    expect(fn).toHaveBeenCalledTimes(1);
    expect(fn).toHaveBeenCalledWith(0);
  });

  it('resets after wait period', () => {
    const fn = vi.fn();
    const debounced = debounceWithImmediate(fn, 100);
    debounced('first');
    vi.advanceTimersByTime(100);
    debounced('second');
    vi.advanceTimersByTime(100);
    expect(fn).toHaveBeenCalledTimes(2);
    expect(fn).toHaveBeenNthCalledWith(1, 'first');
    expect(fn).toHaveBeenNthCalledWith(2, 'second');
  });
});

describe('edge cases', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('wait of 0 still works', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 0);
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('very large wait time', () => {
    const fn = vi.fn();
    const throttled = throttle(fn, 1000000);
    throttled();
    throttled();
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('function that throws', () => {
    const fn = vi.fn(() => { throw new Error('test'); });
    const throttled = throttle(fn, 100);
    expect(() => throttled()).toThrow('test');
  });

  it('async function', async () => {
    const fn = vi.fn(async () => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return 'async-result';
    });
    const throttled = throttle(fn, 100);
    const result = await throttled();
    expect(result).toBe('async-result');
  });
});
]==],
  },
  {
    name = "Binary Search Tree",
    difficulty = "medium",
    stub = [=[
/**
 * Binary Search Tree
 *
 * Implement a Binary Search Tree (BST) with insertion, search, and deletion.
 *
 * A BST is a binary tree where for each node:
 * - All values in the left subtree are less than the node's value
 * - All values in the right subtree are greater than the node's value
 * - No duplicate values are allowed
 *
 * Implement the BST class with:
 * - insert(value: number): void — Insert a value into the tree
 * - search(value: number): boolean — Return true if value exists
 * - delete(value: number): boolean — Remove a value, return true if found
 * - inOrder(): number[] — Return values in sorted order (in-order traversal)
 * - height(): number — Return the height of the tree (max depth)
 * - minValue(): number | null — Return the minimum value in the tree
 * - maxValue(): number | null — Return the maximum value in the tree
 *
 * For delete, handle all three cases:
 * 1. Node with no children (leaf)
 * 2. Node with one child
 * 3. Node with two children (use in-order successor)
 *
 * Bonus: Implement isBalanced(): boolean to check if the tree is height-balanced
 * (difference in height between left and right subtrees is at most 1 for all nodes)
 */

export class BST {
  constructor() {
    // YOUR CODE HERE
  }

  insert(value: number): void {
    // YOUR CODE HERE
  }

  search(value: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(value: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  inOrder(): number[] {
    // YOUR CODE HERE
    return [];
  }

  height(): number {
    // YOUR CODE HERE
    return 0;
  }

  minValue(): number | null {
    // YOUR CODE HERE
    return null;
  }

  maxValue(): number | null {
    // YOUR CODE HERE
    return null;
  }

  isBalanced(): boolean {
    // YOUR CODE HERE
    return true;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { BST } from './challenge';

describe('BST', () => {
  it('creates empty tree', () => {
    const bst = new BST();
    expect(bst.inOrder()).toEqual([]);
    expect(bst.height()).toBe(0);
    expect(bst.minValue()).toBeNull();
    expect(bst.maxValue()).toBeNull();
  });

  it('inserts single value', () => {
    const bst = new BST();
    bst.insert(5);
    expect(bst.search(5)).toBe(true);
    expect(bst.inOrder()).toEqual([5]);
    expect(bst.height()).toBe(1);
  });

  it('inserts multiple values in order', () => {
    const bst = new BST();
    bst.insert(5);
    bst.insert(3);
    bst.insert(7);
    expect(bst.inOrder()).toEqual([3, 5, 7]);
    expect(bst.height()).toBe(2);
  });

  it('inserts multiple values randomly', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.inOrder()).toEqual([3, 5, 7, 10, 12, 15, 20]);
  });

  it('search finds existing values', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7].forEach(v => bst.insert(v));
    expect(bst.search(10)).toBe(true);
    expect(bst.search(5)).toBe(true);
    expect(bst.search(3)).toBe(true);
    expect(bst.search(7)).toBe(true);
    expect(bst.search(15)).toBe(true);
  });

  it('search returns false for missing values', () => {
    const bst = new BST();
    [10, 5, 15].forEach(v => bst.insert(v));
    expect(bst.search(1)).toBe(false);
    expect(bst.search(7)).toBe(false);
    expect(bst.search(12)).toBe(false);
    expect(bst.search(20)).toBe(false);
  });

  it('delete leaf node', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7].forEach(v => bst.insert(v));
    expect(bst.delete(3)).toBe(true);
    expect(bst.search(3)).toBe(false);
    expect(bst.inOrder()).toEqual([5, 7, 10, 15]);
  });

  it('delete node with one child', () => {
    const bst = new BST();
    [10, 5, 15, 3].forEach(v => bst.insert(v));
    expect(bst.delete(5)).toBe(true);
    expect(bst.search(5)).toBe(false);
    expect(bst.search(3)).toBe(true);
    expect(bst.inOrder()).toEqual([3, 10, 15]);
  });

  it('delete node with two children', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.delete(10)).toBe(true);
    expect(bst.search(10)).toBe(false);
    expect(bst.inOrder()).toEqual([3, 5, 7, 12, 15, 20]);
    // Tree should still be valid BST
    expect(bst.search(5)).toBe(true);
    expect(bst.search(15)).toBe(true);
  });

  it('delete root node', () => {
    const bst = new BST();
    bst.insert(10);
    bst.insert(5);
    bst.insert(15);
    expect(bst.delete(10)).toBe(true);
    expect(bst.search(10)).toBe(false);
    expect(bst.inOrder()).toEqual([5, 15]);
  });

  it('delete non-existent value', () => {
    const bst = new BST();
    [10, 5, 15].forEach(v => bst.insert(v));
    expect(bst.delete(99)).toBe(false);
  });

  it('minValue returns correct minimum', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 1, 20].forEach(v => bst.insert(v));
    expect(bst.minValue()).toBe(1);
  });

  it('maxValue returns correct maximum', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 1, 20].forEach(v => bst.insert(v));
    expect(bst.maxValue()).toBe(20);
  });

  it('height of balanced tree', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.height()).toBe(3);
  });

  it('height of skewed tree', () => {
    const bst = new BST();
    [1, 2, 3, 4, 5].forEach(v => bst.insert(v));
    expect(bst.height()).toBe(5);
  });

  it('isBalanced on balanced tree', () => {
    const bst = new BST();
    [10, 5, 15, 3, 7, 12, 20].forEach(v => bst.insert(v));
    expect(bst.isBalanced()).toBe(true);
  });

  it('isBalanced on skewed tree', () => {
    const bst = new BST();
    [1, 2, 3, 4, 5].forEach(v => bst.insert(v));
    expect(bst.isBalanced()).toBe(false);
  });

  it('inOrder on empty tree', () => {
    const bst = new BST();
    expect(bst.inOrder()).toEqual([]);
  });

  it('handles duplicate insertions', () => {
    const bst = new BST();
    bst.insert(5);
    bst.insert(5);
    bst.insert(5);
    expect(bst.inOrder()).toEqual([5]);
    expect(bst.search(5)).toBe(true);
  });

  it('stress test with many insertions', () => {
    const bst = new BST();
    const values = [50, 25, 75, 10, 30, 60, 90, 5, 15, 27, 35, 55, 65, 85, 95];
    values.forEach(v => bst.insert(v));
    expect(bst.inOrder()).toEqual(values.sort((a, b) => a - b));
    values.forEach(v => expect(bst.search(v)).toBe(true));
    expect(bst.height()).toBe(4);
  });

  it('delete all nodes', () => {
    const bst = new BST();
    [10, 5, 15].forEach(v => bst.insert(v));
    expect(bst.delete(10)).toBe(true);
    expect(bst.delete(5)).toBe(true);
    expect(bst.delete(15)).toBe(true);
    expect(bst.inOrder()).toEqual([]);
    expect(bst.height()).toBe(0);
  });
});

// Edge cases
describe('BST edge cases', () => {
  it('negative values', () => {
    const bst = new BST();
    [-5, -10, -3, 0, 5].forEach(v => bst.insert(v));
    expect(bst.inOrder()).toEqual([-10, -5, -3, 0, 5]);
    expect(bst.minValue()).toBe(-10);
    expect(bst.maxValue()).toBe(5);
  });

  it('large values', () => {
    const bst = new BST();
    [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 0].forEach(v => bst.insert(v));
    expect(bst.minValue()).toBe(Number.MIN_SAFE_INTEGER);
    expect(bst.maxValue()).toBe(Number.MAX_SAFE_INTEGER);
  });
});
]=],
  },
  {
    name = "Rate Limiter",
    difficulty = "medium",
    stub = [=[
/**
 * Rate Limiter
 *
 * Implement a rate limiter that restricts the number of requests
 * within a sliding time window.
 *
 * Rate limiting is commonly used to:
 * - Prevent API abuse
 * - Control resource consumption
 * - Enforce usage quotas
 *
 * Implement the RateLimiter class with:
 * - constructor(limit: number, windowMs: number) — Initialize with max requests
 *   allowed per time window (in milliseconds)
 * - allowRequest(clientId: string): boolean — Return true if request is allowed,
 *   false if rate limit exceeded. Does NOT record the request.
 * - recordRequest(clientId: string): void — Record a request for the client.
 * - checkAndRecord(clientId: string): boolean — Atomic check + record. Returns true
 *   if allowed and records it; returns false if limit exceeded.
 * - getRemainingRequests(clientId: string): number — Return how many requests
 *   the client can still make in the current window.
 * - reset(clientId: string): void — Reset the rate limit for a specific client.
 * - resetAll(): void — Reset rate limits for all clients.
 *
 * Use a sliding window algorithm: track timestamps of recent requests and
 * remove expired ones when checking.
 *
 * Bonus: Implement getTokenBucket(clientId: string, tokens: number): boolean
 * for a token bucket algorithm variant where requests can consume multiple tokens.
 */

export class RateLimiter {
  constructor(limit: number, windowMs: number) {
    // YOUR CODE HERE
  }

  allowRequest(clientId: string): boolean {
    // YOUR CODE HERE
    return true;
  }

  recordRequest(clientId: string): void {
    // YOUR CODE HERE
  }

  checkAndRecord(clientId: string): boolean {
    // YOUR CODE HERE
    return true;
  }

  getRemainingRequests(clientId: string): number {
    // YOUR CODE HERE
    return 0;
  }

  reset(clientId: string): void {
    // YOUR CODE HERE
  }

  resetAll(): void {
    // YOUR CODE HERE
  }

  getTokenBucket(clientId: string, tokens: number): boolean {
    // YOUR CODE HERE
    return true;
  }
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { RateLimiter } from './challenge';

describe('RateLimiter', () => {
  beforeEach(() => {
    vi.useFakeTimers();
  });

  afterEach(() => {
    vi.useRealTimers();
  });

  it('allows requests under limit', () => {
    const limiter = new RateLimiter(3, 1000);
    expect(limiter.checkAndRecord('client1')).toBe(true);
    expect(limiter.checkAndRecord('client1')).toBe(true);
    expect(limiter.checkAndRecord('client1')).toBe(true);
  });

  it('blocks requests over limit', () => {
    const limiter = new RateLimiter(3, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
  });

  it('allows requests after window expires', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
    vi.advanceTimersByTime(1000);
    expect(limiter.checkAndRecord('client1')).toBe(true);
  });

  it('tracks different clients independently', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
    expect(limiter.checkAndRecord('client2')).toBe(true);
    expect(limiter.checkAndRecord('client2')).toBe(true);
    expect(limiter.checkAndRecord('client2')).toBe(false);
  });

  it('allowRequest does not record', () => {
    const limiter = new RateLimiter(2, 1000);
    expect(limiter.allowRequest('client1')).toBe(true);
    expect(limiter.allowRequest('client1')).toBe(true);
    expect(limiter.allowRequest('client1')).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(2);
  });

  it('recordRequest records without checking', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.recordRequest('client1');
    limiter.recordRequest('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(0);
    expect(limiter.allowRequest('client1')).toBe(false);
  });

  it('getRemainingRequests returns correct count', () => {
    const limiter = new RateLimiter(5, 1000);
    expect(limiter.getRemainingRequests('client1')).toBe(5);
    limiter.checkAndRecord('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(4);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(2);
  });

  it('reset clears client history', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client1');
    expect(limiter.checkAndRecord('client1')).toBe(false);
    limiter.reset('client1');
    expect(limiter.checkAndRecord('client1')).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(1);
  });

  it('resetAll clears all clients', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    limiter.checkAndRecord('client2');
    limiter.resetAll();
    expect(limiter.getRemainingRequests('client1')).toBe(2);
    expect(limiter.getRemainingRequests('client2')).toBe(2);
  });

  it('sliding window removes old requests', () => {
    const limiter = new RateLimiter(3, 1000);
    limiter.checkAndRecord('client1');
    vi.advanceTimersByTime(500);
    limiter.checkAndRecord('client1');
    vi.advanceTimersByTime(600);
    // First request is now expired (1100ms old)
    expect(limiter.getRemainingRequests('client1')).toBe(2);
  });

  it('multiple requests at boundary', () => {
    const limiter = new RateLimiter(2, 1000);
    limiter.checkAndRecord('client1');
    vi.advanceTimersByTime(999);
    limiter.checkAndRecord('client1');
    expect(limiter.getRemainingRequests('client1')).toBe(0);
    vi.advanceTimersByTime(1);
    // First request expires
    expect(limiter.getRemainingRequests('client1')).toBe(1);
  });

  it('getTokenBucket consumes tokens', () => {
    const limiter = new RateLimiter(10, 1000);
    expect(limiter.getTokenBucket('client1', 3)).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(7);
    expect(limiter.getTokenBucket('client1', 5)).toBe(true);
    expect(limiter.getRemainingRequests('client1')).toBe(2);
    expect(limiter.getTokenBucket('client1', 3)).toBe(false);
  });

  it('getTokenBucket respects limit', () => {
    const limiter = new RateLimiter(5, 1000);
    expect(limiter.getTokenBucket('client1', 10)).toBe(false);
    expect(limiter.getRemainingRequests('client1')).toBe(5);
  });

  it('getTokenBucket with window expiry', () => {
    const limiter = new RateLimiter(5, 1000);
    limiter.getTokenBucket('client1', 3);
    vi.advanceTimersByTime(1000);
    expect(limiter.getTokenBucket('client1', 4)).toBe(true);
  });

  it('zero limit blocks all', () => {
    const limiter = new RateLimiter(0, 1000);
    expect(limiter.checkAndRecord('client1')).toBe(false);
    expect(limiter.allowRequest('client1')).toBe(false);
  });

  it('large window works correctly', () => {
    const limiter = new RateLimiter(100, 60000);
    for (let i = 0; i < 100; i++) {
      expect(limiter.checkAndRecord('client1')).toBe(true);
    }
    expect(limiter.checkAndRecord('client1')).toBe(false);
  });

  it('stress test with many clients', () => {
    const limiter = new RateLimiter(10, 1000);
    for (let i = 0; i < 50; i++) {
      for (let j = 0; j < 10; j++) {
        expect(limiter.checkAndRecord(`client${i}`)).toBe(true);
      }
      expect(limiter.checkAndRecord(`client${i}`)).toBe(false);
    }
  });
});
]=],
  },
  {
    name = "Pub/Sub Event Bus",
    difficulty = "medium",
    stub = [=[
/**
 * Pub/Sub Event Bus
 *
 * Implement a publish-subscribe event bus for decoupled event handling.
 *
 * The Pub/Sub pattern allows objects (publishers) to emit events without
 * knowing which objects (subscribers) will receive them. This enables
 * loose coupling and is widely used in:
 * - Event-driven architectures
 * - Message queues
 * - Reactive programming
 * - Plugin systems
 *
 * Implement the EventBus class with:
 * - subscribe(event: string, callback: (...args: any[]) => void): Subscription
 *   Register a callback for an event. Return a Subscription object with
 *   an unsubscribe() method to remove the listener.
 * - unsubscribe(event: string, callback: (...args: any[]) => void): boolean
 *   Remove a specific callback from an event. Return true if found and removed.
 * - publish(event: string, ...args: any[]): void
 *   Emit an event with optional arguments. All subscribers receive the args.
 * - publishAsync(event: string, ...args: any[]): Promise<void>
 *   Async version that awaits all async callbacks. Collects and rethrows errors.
 * - once(event: string, callback: (...args: any[]) => void): Subscription
 *   Subscribe for a single event firing. Auto-unsubscribes after first publish.
 * - clearEvent(event: string): void
 *   Remove all subscribers for a specific event.
 * - clearAll(): void
 *   Remove all subscribers for all events.
 * - getSubscriberCount(event: string): number
 *   Return how many subscribers are listening to an event.
 * - hasSubscribers(event: string): boolean
 *   Check if an event has any subscribers.
 *
 * Bonus: Implement wildcard subscriptions:
 * - subscribePattern(pattern: string, callback: (...args: any[]) => void): Subscription
 *   Support patterns like "user.*" or "user.created" or "user.*.deleted"
 *   Use glob-style matching where * matches any single segment.
 */

export interface Subscription {
  unsubscribe(): void;
  readonly event: string;
  readonly callback: (...args: any[]) => void;
}

export class EventBus {
  constructor() {
    // YOUR CODE HERE
  }

  subscribe(event: string, callback: (...args: any[]) => void): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {}, event, callback };
  }

  unsubscribe(event: string, callback: (...args: any[]) => void): boolean {
    // YOUR CODE HERE
    return false;
  }

  publish(event: string, ...args: any[]): void {
    // YOUR CODE HERE
  }

  publishAsync(event: string, ...args: any[]): Promise<void> {
    // YOUR CODE HERE
    return Promise.resolve();
  }

  once(event: string, callback: (...args: any[]) => void): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {}, event, callback };
  }

  clearEvent(event: string): void {
    // YOUR CODE HERE
  }

  clearAll(): void {
    // YOUR CODE HERE
  }

  getSubscriberCount(event: string): number {
    // YOUR CODE HERE
    return 0;
  }

  hasSubscribers(event: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  subscribePattern(pattern: string, callback: (...args: any[]) => void): Subscription {
    // YOUR CODE HERE
    return { unsubscribe: () => {}, event: pattern, callback };
  }
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { EventBus } from './challenge';

describe('EventBus', () => {
  let bus: EventBus;

  beforeEach(() => {
    bus = new EventBus();
  });

  it('subscribes and publishes events', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    bus.publish('test', 'hello', 42);
    expect(callback).toHaveBeenCalledWith('hello', 42);
    expect(callback).toHaveBeenCalledTimes(1);
  });

  it('subscribes multiple listeners to same event', () => {
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    bus.subscribe('test', cb1);
    bus.subscribe('test', cb2);
    bus.publish('test', 'data');
    expect(cb1).toHaveBeenCalledWith('data');
    expect(cb2).toHaveBeenCalledWith('data');
    expect(cb1).toHaveBeenCalledTimes(1);
    expect(cb2).toHaveBeenCalledTimes(1);
  });

  it('unsubscribe removes listener', () => {
    const callback = vi.fn();
    const subscription = bus.subscribe('test', callback);
    bus.publish('test', 'first');
    subscription.unsubscribe();
    bus.publish('test', 'second');
    expect(callback).toHaveBeenCalledWith('first');
    expect(callback).not.toHaveBeenCalledWith('second');
    expect(callback).toHaveBeenCalledTimes(1);
  });

  it('unsubscribe returns boolean', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    expect(bus.unsubscribe('test', callback)).toBe(true);
    expect(bus.unsubscribe('test', callback)).toBe(false);
    expect(bus.unsubscribe('nonexistent', callback)).toBe(false);
  });

  it('once fires only once', () => {
    const callback = vi.fn();
    bus.once('test', callback);
    bus.publish('test', 'first');
    bus.publish('test', 'second');
    bus.publish('test', 'third');
    expect(callback).toHaveBeenCalledTimes(1);
    expect(callback).toHaveBeenCalledWith('first');
  });

  it('once returns subscription with unsubscribe', () => {
    const callback = vi.fn();
    const subscription = bus.once('test', callback);
    subscription.unsubscribe();
    bus.publish('test', 'data');
    expect(callback).not.toHaveBeenCalled();
  });

  it('getSubscriberCount returns correct count', () => {
    expect(bus.getSubscriberCount('test')).toBe(0);
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    bus.subscribe('test', cb1);
    expect(bus.getSubscriberCount('test')).toBe(1);
    bus.subscribe('test', cb2);
    expect(bus.getSubscriberCount('test')).toBe(2);
    bus.unsubscribe('test', cb1);
    expect(bus.getSubscriberCount('test')).toBe(1);
  });

  it('hasSubscribers returns boolean', () => {
    expect(bus.hasSubscribers('test')).toBe(false);
    bus.subscribe('test', vi.fn());
    expect(bus.hasSubscribers('test')).toBe(true);
  });

  it('clearEvent removes all listeners for event', () => {
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    const cb3 = vi.fn();
    bus.subscribe('test', cb1);
    bus.subscribe('test', cb2);
    bus.subscribe('other', cb3);
    bus.clearEvent('test');
    expect(bus.getSubscriberCount('test')).toBe(0);
    expect(bus.getSubscriberCount('other')).toBe(1);
    bus.publish('test', 'data');
    expect(cb1).not.toHaveBeenCalled();
    expect(cb2).not.toHaveBeenCalled();
  });

  it('clearAll removes all listeners', () => {
    bus.subscribe('test1', vi.fn());
    bus.subscribe('test2', vi.fn());
    bus.subscribe('test3', vi.fn());
    bus.clearAll();
    expect(bus.getSubscriberCount('test1')).toBe(0);
    expect(bus.getSubscriberCount('test2')).toBe(0);
    expect(bus.getSubscriberCount('test3')).toBe(0);
  });

  it('publish with no listeners does not throw', () => {
    expect(() => bus.publish('nonexistent', 'data')).not.toThrow();
  });

  it('publish passes all arguments', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    bus.publish('test', 1, 'two', true, null, { key: 'value' });
    expect(callback).toHaveBeenCalledWith(1, 'two', true, null, { key: 'value' });
  });

  it('publishAsync awaits async callbacks', async () => {
    const results: number[] = [];
    const asyncCb1 = async () => {
      await new Promise(resolve => setTimeout(resolve, 10));
      results.push(1);
    };
    const asyncCb2 = async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      results.push(2);
    };
    bus.subscribe('test', asyncCb1);
    bus.subscribe('test', asyncCb2);
    await bus.publishAsync('test');
    expect(results).toEqual([1, 2]);
  });

  it('publishAsync collects errors', async () => {
    const error = new Error('test error');
    const asyncCb = async () => {
      throw error;
    };
    bus.subscribe('test', asyncCb);
    await expect(bus.publishAsync('test')).rejects.toThrow('test error');
  });

  it('different events are independent', () => {
    const cb1 = vi.fn();
    const cb2 = vi.fn();
    bus.subscribe('event1', cb1);
    bus.subscribe('event2', cb2);
    bus.publish('event1', 'data1');
    bus.publish('event2', 'data2');
    expect(cb1).toHaveBeenCalledWith('data1');
    expect(cb1).not.toHaveBeenCalledWith('data2');
    expect(cb2).toHaveBeenCalledWith('data2');
    expect(cb2).not.toHaveBeenCalledWith('data1');
  });

  it('subscription has correct event and callback', () => {
    const callback = vi.fn();
    const subscription = bus.subscribe('myevent', callback);
    expect(subscription.event).toBe('myevent');
    expect(subscription.callback).toBe(callback);
  });

  it('unsubscribe via subscription object', () => {
    const callback = vi.fn();
    const subscription = bus.subscribe('test', callback);
    bus.publish('test', 'first');
    subscription.unsubscribe();
    bus.publish('test', 'second');
    expect(callback).toHaveBeenCalledTimes(1);
    expect(callback).toHaveBeenCalledWith('first');
  });

  it('multiple unsubscribe calls are safe', () => {
    const callback = vi.fn();
    bus.subscribe('test', callback);
    expect(bus.unsubscribe('test', callback)).toBe(true);
    expect(bus.unsubscribe('test', callback)).toBe(false);
    expect(bus.unsubscribe('test', callback)).toBe(false);
  });

  it('subscribePattern with wildcard matches', () => {
    const cb = vi.fn();
    bus.subscribePattern('user.*', cb);
    bus.publish('user.created', { id: 1 });
    bus.publish('user.deleted', { id: 2 });
    bus.publish('user.updated', { id: 3 });
    expect(cb).toHaveBeenCalledTimes(3);
  });

  it('subscribePattern does not match unrelated events', () => {
    const cb = vi.fn();
    bus.subscribePattern('user.*', cb);
    bus.publish('product.created', { id: 1 });
    bus.publish('order.created', { id: 2 });
    expect(cb).not.toHaveBeenCalled();
  });

  it('subscribePattern with multiple wildcards', () => {
    const cb = vi.fn();
    bus.subscribePattern('*.*.deleted', cb);
    bus.publish('user.account.deleted', { id: 1 });
    bus.publish('product.item.deleted', { id: 2 });
    bus.publish('user.account.created', { id: 3 });
    expect(cb).toHaveBeenCalledTimes(2);
  });

  it('pattern subscription can be unsubscribed', () => {
    const cb = vi.fn();
    const subscription = bus.subscribePattern('test.*', cb);
    bus.publish('test.event', 'data');
    subscription.unsubscribe();
    bus.publish('test.other', 'data');
    expect(cb).toHaveBeenCalledTimes(1);
  });

  it('getSubscriberCount includes pattern subscribers', () => {
    bus.subscribe('user.created', vi.fn());
    bus.subscribePattern('user.*', vi.fn());
    expect(bus.getSubscriberCount('user.created')).toBe(2);
  });

  it('stress test with many events and subscribers', () => {
    const callbacks: ReturnType<typeof vi.fn>[] = [];
    for (let i = 0; i < 100; i++) {
      const cb = vi.fn();
      callbacks.push(cb);
      bus.subscribe(`event${i % 10}`, cb);
    }
    for (let i = 0; i < 10; i++) {
      bus.publish(`event${i}`, 'data');
    }
    callbacks.forEach(cb => {
      expect(cb).toHaveBeenCalledTimes(1);
    });
  });
});
]=],
  },
  {
    name = "Memoize with Cache Key Generator",
    difficulty = "easy",
    stub = [=[
/**
 * Memoize with Cache Key Generator
 *
 * Implement a memoization higher-order function with customizable cache key generation.
 *
 * Memoization is an optimization technique that caches function results based on
 * input arguments, returning the cached result when the same inputs occur again.
 *
 * The challenge is to implement:
 * - A generic memoize function that wraps any function
 * - A cache key generator that converts arguments to a stable string key
 * - Support for custom key generators per function
 * - Cache inspection and management methods
 *
 * Implement:
 * - createCacheKey(args: any[]): string — Default key generator using JSON.stringify
 * - memoize<T extends (...args: any[]) => any>(
 *     fn: T,
 *     options?: { keyGenerator?: (...args: any[]) => string, maxCacheSize?: number }
 *   ): T & { cache: Map<string, any>, hits: number, misses: number, clear(): void, size(): number }
 *
 * The memoized function should:
 * - Cache results based on arguments
 * - Track hit/miss statistics
 * - Support max cache size with LRU eviction when exceeded
 * - Provide cache management methods
 *
 * Edge cases to handle:
 * - Functions with no arguments
 * - Functions with many arguments
 * - Arguments that are objects/arrays (need stable serialization)
 * - Circular references in arguments (should not crash)
 */

export function createCacheKey(args: any[]): string {
  // YOUR CODE HERE
  return '';
}

export function memoize<T extends (...args: any[]) => any>(
  fn: T,
  options?: {
    keyGenerator?: (...args: any[]) => string;
    maxCacheSize?: number;
  }
): T & {
  cache: Map<string, any>;
  hits: number;
  misses: number;
  clear(): void;
  size(): number;
} {
  // YOUR CODE HERE
  const memoized = (() => {}) as T;
  return Object.assign(memoized, {
    cache: new Map(),
    hits: 0,
    misses: 0,
    clear() {},
    size() { return 0; }
  });
}
]=],
    tests = [=[
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { memoize, createCacheKey } from './challenge';

describe('createCacheKey', () => {
  it('creates key for no arguments', () => {
    expect(createCacheKey([])).toBe('[]');
  });

  it('creates key for primitive arguments', () => {
    expect(createCacheKey([1, 2, 3])).toBe('[1,2,3]');
    expect(createCacheKey(['a', 'b', 'c'])).toBe('["a","b","c"]');
  });

  it('creates key for mixed arguments', () => {
    expect(createCacheKey([1, 'hello', true, null])).toBe('[1,"hello",true,null]');
  });

  it('creates key for object arguments', () => {
    const key = createCacheKey([{ a: 1, b: 2 }]);
    expect(key).toContain('"a":1');
    expect(key).toContain('"b":2');
  });

  it('creates consistent keys for same objects', () => {
    const obj = { x: 10, y: 20 };
    const key1 = createCacheKey([obj]);
    const key2 = createCacheKey([obj]);
    expect(key1).toBe(key2);
  });

  it('handles nested objects', () => {
    const key = createCacheKey([{ user: { name: 'Alice', age: 30 } }]);
    expect(key).toContain('"user"');
    expect(key).toContain('"name":"Alice"');
  });
});

describe('memoize', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  it('caches function results', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    expect(memoized(5)).toBe(10);
    expect(memoized(5)).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('tracks hits and misses', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    memoized(5);
    expect(memoized.misses).toBe(1);
    expect(memoized.hits).toBe(0);
    
    memoized(5);
    expect(memoized.hits).toBe(1);
    expect(memoized.misses).toBe(1);
    
    memoized(10);
    expect(memoized.hits).toBe(1);
    expect(memoized.misses).toBe(2);
  });

  it('exposes cache', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    memoized(5);
    expect(memoized.cache.size).toBe(1);
    expect(memoized.cache.has('[5]')).toBe(true);
  });

  it('clear method empties cache', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    memoized(5);
    memoized(10);
    expect(memoized.cache.size).toBe(2);
    
    memoized.clear();
    expect(memoized.cache.size).toBe(0);
    expect(memoized.hits).toBe(0);
    expect(memoized.misses).toBe(0);
  });

  it('size method returns cache size', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    expect(memoized.size()).toBe(0);
    memoized(5);
    expect(memoized.size()).toBe(1);
    memoized(10);
    expect(memoized.size()).toBe(2);
  });

  it('handles functions with no arguments', () => {
    let counter = 0;
    const fn = vi.fn(() => ++counter);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(1);
    expect(memoized()).toBe(1);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions with multiple arguments', () => {
    const fn = vi.fn((a: number, b: number, c: number) => a + b + c);
    const memoized = memoize(fn);
    
    expect(memoized(1, 2, 3)).toBe(6);
    expect(memoized(1, 2, 3)).toBe(6);
    expect(memoized(3, 2, 1)).toBe(6);
    expect(memoized(3, 2, 1)).toBe(6);
    expect(fn).toHaveBeenCalledTimes(2);
  });

  it('handles object arguments', () => {
    const fn = vi.fn((obj: { x: number }) => obj.x * 2);
    const memoized = memoize(fn);
    
    expect(memoized({ x: 5 })).toBe(10);
    expect(memoized({ x: 5 })).toBe(10);
    expect(fn).toHaveBeenCalledTimes(2); // Different object references
  });

  it('same object reference is cached', () => {
    const fn = vi.fn((obj: { x: number }) => obj.x * 2);
    const memoized = memoize(fn);
    const obj = { x: 5 };
    
    expect(memoized(obj)).toBe(10);
    expect(memoized(obj)).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('custom key generator', () => {
    const fn = vi.fn((x: number) => x * 2);
    const keyGen = (x: number) => `custom:${x}`;
    const memoized = memoize(fn, { keyGenerator: keyGen });
    
    memoized(5);
    expect(memoized.cache.has('custom:5')).toBe(true);
  });

  it('maxCacheSize triggers LRU eviction', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 2 });
    
    memoized(1);
    memoized(2);
    expect(memoized.size()).toBe(2);
    
    memoized(3); // Should evict oldest (1)
    expect(memoized.size()).toBe(2);
    expect(memoized.cache.has('[1]')).toBe(false);
    expect(memoized.cache.has('[2]')).toBe(true);
    expect(memoized.cache.has('[3]')).toBe(true);
  });

  it('LRU eviction on access refresh', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 2 });
    
    memoized(1);
    memoized(2);
    memoized(1); // Access 1, making 2 the oldest
    memoized(3); // Should evict 2, not 1
    
    expect(memoized.cache.has('[1]')).toBe(true);
    expect(memoized.cache.has('[2]')).toBe(false);
    expect(memoized.cache.has('[3]')).toBe(true);
  });

  it('preserves function context', () => {
    const obj = {
      multiplier: 2,
      multiply(x: number) { return x * this.multiplier; }
    };
    const memoized = memoize(obj.multiply.bind(obj));
    
    expect(memoized(5)).toBe(10);
    expect(memoized(5)).toBe(10);
  });

  it('handles async functions', async () => {
    const fn = vi.fn(async (x: number) => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return x * 2;
    });
    const memoized = memoize(fn);
    
    const result1 = await memoized(5);
    const result2 = await memoized(5);
    
    expect(result1).toBe(10);
    expect(result2).toBe(10);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning undefined', () => {
    const fn = vi.fn(() => undefined);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(undefined);
    expect(memoized()).toBe(undefined);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning null', () => {
    const fn = vi.fn(() => null);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(null);
    expect(memoized()).toBe(null);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning 0', () => {
    const fn = vi.fn(() => 0);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(0);
    expect(memoized()).toBe(0);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning false', () => {
    const fn = vi.fn(() => false);
    const memoized = memoize(fn);
    
    expect(memoized()).toBe(false);
    expect(memoized()).toBe(false);
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('handles functions returning empty string', () => {
    const fn = vi.fn(() => '');
    const memoized = memoize(fn);
    
    expect(memoized()).toBe('');
    expect(memoized()).toBe('');
    expect(fn).toHaveBeenCalledTimes(1);
  });

  it('stress test with many calls', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn);
    
    for (let i = 0; i < 1000; i++) {
      memoized(i % 10);
    }
    
    expect(fn).toHaveBeenCalledTimes(10); // Only 10 unique inputs
    expect(memoized.hits).toBe(990);
    expect(memoized.misses).toBe(10);
  });

  it('maxCacheSize of 1', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 1 });
    
    memoized(1);
    expect(memoized.size()).toBe(1);
    memoized(2);
    expect(memoized.size()).toBe(1);
    expect(memoized.cache.has('[1]')).toBe(false);
    expect(memoized.cache.has('[2]')).toBe(true);
  });

  it('maxCacheSize equals cache growth without eviction', () => {
    const fn = vi.fn((x: number) => x * 2);
    const memoized = memoize(fn, { maxCacheSize: 100 });
    
    for (let i = 0; i < 50; i++) {
      memoized(i);
    }
    
    expect(memoized.size()).toBe(50);
  });
});

describe('edge cases', () => {
  it('circular reference in arguments', () => {
    const fn = vi.fn((obj: any) => obj);
    const memoized = memoize(fn);
    
    const obj: any = { x: 1 };
    obj.self = obj;
    
    // Should not crash, but may not cache properly
    expect(() => memoized(obj)).not.toThrow();
  });

  it('symbol arguments', () => {
    const fn = vi.fn((sym: symbol) => sym.description);
    const memoized = memoize(fn);
    
    const sym = Symbol('test');
    expect(memoized(sym)).toBe('test');
  });

  it('function arguments', () => {
    const fn = vi.fn((cb: () => void) => cb());
    const memoized = memoize(fn);
    
    const cb = () => 42;
    expect(memoized(cb)).toBe(42);
  });
});
]=],
  },
  {
    name = "Min-Heap Priority Queue",
    difficulty = "medium",
    stub = [=[
/**
 * Min-Heap Priority Queue
 *
 * Implement a binary min-heap based priority queue.
 *
 * A min-heap is a complete binary tree where each node is smaller than
 * or equal to its children. This structure enables efficient retrieval
 * of the minimum element and is commonly used for:
 * - Priority queues
 * - Heap sort
 * - Finding k smallest/largest elements
 * - Dijkstra's shortest path algorithm
 * - Merge k sorted lists
 *
 * Implement the MinHeap class with:
 * - constructor(initialValues?: number[]) — Optionally initialize with an array
 * - insert(value: number): void — Add a value to the heap (O(log n))
 * - extractMin(): number | null — Remove and return the minimum value (O(log n))
 * - peek(): number | null — Return the minimum value without removing (O(1))
 * - size(): number — Return the number of elements in the heap
 * - isEmpty(): boolean — Check if the heap is empty
 * - heapify(): void — Convert an arbitrary array into a heap (O(n))
 * - decreaseKey(index: number, newValue: number): boolean — Decrease the value
 *   at a given index (useful for Dijkstra's). Return false if index invalid or
 *   newValue > currentValue.
 * - delete(index: number): boolean — Delete element at index (O(log n))
 *
 * Bonus: Implement a generic MinHeap<T> that accepts a custom comparator:
 * - constructor(compareFn?: (a: T, b: T) => number)
 */

export class MinHeap {
  constructor(initialValues?: number[]) {
    // YOUR CODE HERE
  }

  insert(value: number): void {
    // YOUR CODE HERE
  }

  extractMin(): number | null {
    // YOUR CODE HERE
    return null;
  }

  peek(): number | null {
    // YOUR CODE HERE
    return null;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  isEmpty(): boolean {
    // YOUR CODE HERE
    return true;
  }

  heapify(): void {
    // YOUR CODE HERE
  }

  decreaseKey(index: number, newValue: number): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(index: number): boolean {
    // YOUR CODE HERE
    return false;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { MinHeap } from './challenge';

describe('MinHeap', () => {
  it('creates empty heap', () => {
    const heap = new MinHeap();
    expect(heap.isEmpty()).toBe(true);
    expect(heap.size()).toBe(0);
    expect(heap.peek()).toBeNull();
  });

  it('inserts single value', () => {
    const heap = new MinHeap();
    heap.insert(5);
    expect(heap.size()).toBe(1);
    expect(heap.peek()).toBe(5);
    expect(heap.isEmpty()).toBe(false);
  });

  it('inserts multiple values in order', () => {
    const heap = new MinHeap();
    heap.insert(1);
    heap.insert(2);
    heap.insert(3);
    expect(heap.peek()).toBe(1);
    expect(heap.size()).toBe(3);
  });

  it('inserts multiple values in reverse order', () => {
    const heap = new MinHeap();
    heap.insert(5);
    heap.insert(4);
    heap.insert(3);
    heap.insert(2);
    heap.insert(1);
    expect(heap.peek()).toBe(1);
    expect(heap.size()).toBe(5);
  });

  it('extractMin returns values in sorted order', () => {
    const heap = new MinHeap();
    [5, 3, 7, 1, 9, 2, 8].forEach(v => heap.insert(v));
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 2, 3, 5, 7, 8, 9]);
  });

  it('extractMin from empty heap returns null', () => {
    const heap = new MinHeap();
    expect(heap.extractMin()).toBeNull();
  });

  it('peek from empty heap returns null', () => {
    const heap = new MinHeap();
    expect(heap.peek()).toBeNull();
  });

  it('initializes with array', () => {
    const heap = new MinHeap([5, 3, 7, 1, 9]);
    expect(heap.size()).toBe(5);
    expect(heap.peek()).toBe(1);
  });

  it('heapify converts array to heap', () => {
    const heap = new MinHeap([9, 7, 5, 3, 1]);
    heap.heapify();
    expect(heap.peek()).toBe(1);
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual([1, 3, 5, 7, 9]);
  });

  it('decreaseKey moves element up', () => {
    const heap = new MinHeap([1, 2, 3, 4, 5]);
    heap.heapify();
    // Decrease value at index 4 (value 5) to 0
    expect(heap.decreaseKey(4, 0)).toBe(true);
    expect(heap.peek()).toBe(0);
  });

  it('decreaseKey returns false for invalid decrease', () => {
    const heap = new MinHeap([1, 2, 3]);
    heap.heapify();
    // Try to increase value (not allowed)
    expect(heap.decreaseKey(0, 10)).toBe(false);
  });

  it('decreaseKey returns false for invalid index', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.decreaseKey(99, 0)).toBe(false);
    expect(heap.decreaseKey(-1, 0)).toBe(false);
  });

  it('delete removes element', () => {
    const heap = new MinHeap([5, 3, 7, 1, 9]);
    heap.heapify();
    expect(heap.delete(0)).toBe(true); // Delete root (1)
    expect(heap.peek()).toBe(3);
    expect(heap.size()).toBe(4);
  });

  it('delete returns false for invalid index', () => {
    const heap = new MinHeap([1, 2, 3]);
    expect(heap.delete(99)).toBe(false);
  });

  it('stress test with many insertions', () => {
    const heap = new MinHeap();
    const values = [50, 25, 75, 10, 30, 60, 90, 5, 15, 27, 35, 55, 65, 85, 95];
    values.forEach(v => heap.insert(v));
    
    const result: number[] = [];
    while (!heap.isEmpty()) {
      result.push(heap.extractMin()!);
    }
    expect(result).toEqual(values.sort((a, b) => a - b));
  });
});
]=],
  },
  {
    name = "Trie (Prefix Tree)",
    difficulty = "medium",
    stub = [=[
/**
 * Trie (Prefix Tree)
 *
 * Implement a Trie data structure for efficient string storage and retrieval.
 *
 * A Trie is a tree-like structure where each node represents a character,
 * and paths from root to nodes represent strings. Commonly used for:
 * - Autocomplete systems
 * - Spell checkers
 * - IP routing (longest prefix match)
 * - Predictive text
 *
 * Implement the Trie class with:
 * - insert(word: string): void — Insert a word into the trie
 * - search(word: string): boolean — Return true if word exists in trie
 * - startsWith(prefix: string): boolean — Return true if any word starts with prefix
 * - delete(word: string): boolean — Remove a word, return true if found
 * - countWords(): number — Return total number of words stored
 * - countNodes(): number — Return total number of nodes in trie
 * - findWordsWithPrefix(prefix: string): string[] — Return all words with given prefix
 * - autocomplete(prefix: string, limit?: number): string[] — Return up to limit completions
 *
 * Bonus: Implement a generic Trie<T> that stores values at word endpoints:
 * - insert(word: string, value: T): void
 * - get(word: string): T | undefined
 */

export class Trie {
  constructor() {
    // YOUR CODE HERE
  }

  insert(word: string): void {
    // YOUR CODE HERE
  }

  search(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  startsWith(prefix: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  delete(word: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  countWords(): number {
    // YOUR CODE HERE
    return 0;
  }

  countNodes(): number {
    // YOUR CODE HERE
    return 0;
  }

  findWordsWithPrefix(prefix: string): string[] {
    // YOUR CODE HERE
    return [];
  }

  autocomplete(prefix: string, limit?: number): string[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Trie } from './challenge';

describe('Trie', () => {
  it('creates empty trie', () => {
    const trie = new Trie();
    expect(trie.countWords()).toBe(0);
    expect(trie.search('')).toBe(false);
  });

  it('inserts single word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hello')).toBe(true);
    expect(trie.countWords()).toBe(1);
  });

  it('inserts multiple words', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.insert('card');
    expect(trie.search('cat')).toBe(true);
    expect(trie.search('car')).toBe(true);
    expect(trie.search('card')).toBe(true);
    expect(trie.countWords()).toBe(3);
  });

  it('search returns false for non-existent words', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.search('hell')).toBe(false);
    expect(trie.search('helloo')).toBe(false);
    expect(trie.search('world')).toBe(false);
  });

  it('startsWith checks prefixes', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.startsWith('h')).toBe(true);
    expect(trie.startsWith('he')).toBe(true);
    expect(trie.startsWith('hel')).toBe(true);
    expect(trie.startsWith('hell')).toBe(true);
    expect(trie.startsWith('hello')).toBe(true);
    expect(trie.startsWith('x')).toBe(false);
  });

  it('startsWith returns false after delete', () => {
    const trie = new Trie();
    trie.insert('test');
    expect(trie.startsWith('te')).toBe(true);
    trie.delete('test');
    expect(trie.startsWith('te')).toBe(false);
  });

  it('delete existing word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.delete('hello')).toBe(true);
    expect(trie.search('hello')).toBe(false);
    expect(trie.countWords()).toBe(0);
  });

  it('delete non-existent word', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.delete('world')).toBe(false);
  });

  it('delete preserves shared prefixes', () => {
    const trie = new Trie();
    trie.insert('cat');
    trie.insert('car');
    trie.delete('cat');
    expect(trie.search('cat')).toBe(false);
    expect(trie.search('car')).toBe(true);
    expect(trie.startsWith('ca')).toBe(true);
  });

  it('countNodes returns correct count', () => {
    const trie = new Trie();
    expect(trie.countNodes()).toBe(1); // Root node
    trie.insert('abc');
    expect(trie.countNodes()).toBe(4); // Root + a + b + c
  });

  it('findWordsWithPrefix finds all matching words', () => {
    const trie = new Trie();
    trie.insert('apple');
    trie.insert('app');
    trie.insert('application');
    trie.insert('apply');
    trie.insert('banana');
    
    const words = trie.findWordsWithPrefix('app');
    expect(words).toHaveLength(4);
    expect(words).toContain('apple');
    expect(words).toContain('app');
    expect(words).toContain('application');
    expect(words).toContain('apply');
  });

  it('findWordsWithPrefix returns empty for non-existent prefix', () => {
    const trie = new Trie();
    trie.insert('hello');
    expect(trie.findWordsWithPrefix('x')).toEqual([]);
  });

  it('autocomplete respects limit', () => {
    const trie = new Trie();
    trie.insert('apple');
    trie.insert('app');
    trie.insert('application');
    trie.insert('apply');
    
    const results = trie.autocomplete('app', 2);
    expect(results.length).toBeLessThanOrEqual(2);
    results.forEach(r => expect(r.startsWith('app')).toBe(true));
  });

  it('autocomplete without limit', () => {
    const trie = new Trie();
    trie.insert('test');
    trie.insert('testing');
    trie.insert('tester');
    
    const results = trie.autocomplete('test');
    expect(results).toHaveLength(3);
  });

  it('handles empty string insert', () => {
    const trie = new Trie();
    trie.insert('');
    expect(trie.search('')).toBe(true);
    expect(trie.countWords()).toBe(1);
  });

  it('handles single character words', () => {
    const trie = new Trie();
    trie.insert('a');
    trie.insert('b');
    trie.insert('c');
    expect(trie.search('a')).toBe(true);
    expect(trie.search('b')).toBe(true);
    expect(trie.search('c')).toBe(true);
    expect(trie.search('d')).toBe(false);
  });

  it('handles duplicate inserts', () => {
    const trie = new Trie();
    trie.insert('hello');
    trie.insert('hello');
    expect(trie.search('hello')).toBe(true);
    // Depending on implementation, countWords might be 1 or 2
    expect(trie.countWords()).toBeGreaterThanOrEqual(1);
  });

  it('stress test with many words', () => {
    const trie = new Trie();
    const words = ['apple', 'application', 'apply', 'banana', 'band', 'can', 'cat', 'card'];
    words.forEach(w => trie.insert(w));
    
    expect(trie.countWords()).toBe(words.length);
    words.forEach(w => expect(trie.search(w)).toBe(true));
  });

  it('autocomplete returns sorted results', () => {
    const trie = new Trie();
    trie.insert('zebra');
    trie.insert('apple');
    trie.insert('banana');
    
    const results = trie.autocomplete('');
    expect(results).toEqual(['apple', 'banana', 'zebra']);
  });
});
]=],
  },
  {
    name = "Bloom Filter",
    difficulty = "medium",
    stub = [=[
/**
 * Bloom Filter
 *
 * Implement a space-efficient probabilistic data structure for membership testing.
 *
 * A Bloom filter can tell you:
 * - "Definitely NOT in the set" (no false negatives)
 * - "Probably in the set" (possible false positives)
 *
 * It uses multiple hash functions to set bits in a bit array. To check membership,
 * verify all corresponding bits are set. Commonly used in:
 * - Database query optimization (avoiding disk lookups)
 * - Web crawlers (avoiding revisiting URLs)
 * - Cache filtering (avoiding cache misses)
 * - Network security (blocked IP/URL lists)
 *
 * Implement the BloomFilter class with:
 * - constructor(capacity: number, falsePositiveRate?: number) — Initialize with
 *   expected capacity and optional false positive rate (default 0.01)
 * - add(item: string): void — Add an item to the filter
 * - has(item: string): boolean — Check if item might be in the set
 * - size(): number — Return number of items added (approximate)
 * - clear(): void — Reset the filter
 *
 * The filter should automatically calculate optimal:
 * - Bit array size (m) based on capacity and false positive rate
 * - Number of hash functions (k) for optimal accuracy
 *
 * Bonus: Implement union and intersection operations:
 * - union(other: BloomFilter): BloomFilter
 * - intersection(other: BloomFilter): BloomFilter
 */

export class BloomFilter {
  constructor(capacity: number, falsePositiveRate?: number) {
    // YOUR CODE HERE
  }

  add(item: string): void {
    // YOUR CODE HERE
  }

  has(item: string): boolean {
    // YOUR CODE HERE
    return false;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  union(other: BloomFilter): BloomFilter {
    // YOUR CODE HERE
    return new BloomFilter(1);
  }

  intersection(other: BloomFilter): BloomFilter {
    // YOUR CODE HERE
    return new BloomFilter(1);
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { BloomFilter } from './challenge';

describe('BloomFilter', () => {
  it('creates empty filter', () => {
    const filter = new BloomFilter(100);
    expect(filter.has('anything')).toBe(false);
  });

  it('adds and finds single item', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    expect(filter.has('hello')).toBe(true);
  });

  it('returns false for non-existent items', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    expect(filter.has('world')).toBe(false);
  });

  it('handles multiple items', () => {
    const filter = new BloomFilter(1000);
    const items = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
    items.forEach(item => filter.add(item));
    
    items.forEach(item => {
      expect(filter.has(item)).toBe(true);
    });
  });

  it('tracks size correctly', () => {
    const filter = new BloomFilter(100);
    expect(filter.size()).toBe(0);
    filter.add('one');
    expect(filter.size()).toBe(1);
    filter.add('two');
    expect(filter.size()).toBe(2);
  });

  it('clear resets the filter', () => {
    const filter = new BloomFilter(100);
    filter.add('hello');
    filter.add('world');
    filter.clear();
    expect(filter.has('hello')).toBe(false);
    expect(filter.has('world')).toBe(false);
    expect(filter.size()).toBe(0);
  });

  it('no false negatives', () => {
    const filter = new BloomFilter(1000, 0.01);
    const items: string[] = [];
    
    // Add 100 items
    for (let i = 0; i < 100; i++) {
      const item = `item_${i}`;
      items.push(item);
      filter.add(item);
    }
    
    // All added items must be found (no false negatives)
    items.forEach(item => {
      expect(filter.has(item)).toBe(true);
    });
  });

  it('handles empty strings', () => {
    const filter = new BloomFilter(100);
    filter.add('');
    expect(filter.has('')).toBe(true);
    expect(filter.has('non-empty')).toBe(false);
  });

  it('handles special characters', () => {
    const filter = new BloomFilter(100);
    const special = ['!@#$', 'hello\nworld', 'tab\there', 'unicode'];
    special.forEach(s => filter.add(s));
    special.forEach(s => expect(filter.has(s)).toBe(true));
  });

  it('union combines two filters', () => {
    const filter1 = new BloomFilter(100);
    const filter2 = new BloomFilter(100);
    
    filter1.add('a');
    filter1.add('b');
    filter2.add('c');
    filter2.add('d');
    
    const union = filter1.union(filter2);
    expect(union.has('a')).toBe(true);
    expect(union.has('b')).toBe(true);
    expect(union.has('c')).toBe(true);
    expect(union.has('d')).toBe(true);
  });

  it('intersection finds common elements', () => {
    const filter1 = new BloomFilter(100);
    const filter2 = new BloomFilter(100);
    
    filter1.add('a');
    filter1.add('b');
    filter1.add('c');
    filter2.add('b');
    filter2.add('c');
    filter2.add('d');
    
    const intersection = filter1.intersection(filter2);
    expect(intersection.has('b')).toBe(true);
    expect(intersection.has('c')).toBe(true);
    // Note: false positives possible for 'a' and 'd'
  });

  it('different false positive rates affect accuracy', () => {
    const filter1 = new BloomFilter(100, 0.001); // Low FP rate
    const filter2 = new BloomFilter(100, 0.1); // High FP rate
    
    const items: string[] = [];
    for (let i = 0; i < 50; i++) {
      const item = `item_${i}`;
      items.push(item);
      filter1.add(item);
      filter2.add(item);
    }
    
    // Test with items not in either filter
    let fp1 = 0, fp2 = 0;
    for (let i = 50; i < 150; i++) {
      const item = `item_${i}`;
      if (filter1.has(item)) fp1++;
      if (filter2.has(item)) fp2++;
    }
    
    // Higher FP rate should have more false positives (statistically)
    // This is a soft assertion due to probabilistic nature
    expect(fp2).toBeGreaterThanOrEqual(fp1);
  });

  it('stress test with many items', () => {
    const filter = new BloomFilter(10000, 0.01);
    const items: string[] = [];
    
    for (let i = 0; i < 5000; i++) {
      const item = `stress_item_${i}`;
      items.push(item);
      filter.add(item);
    }
    
    // All added items must be found
    items.forEach(item => {
      expect(filter.has(item)).toBe(true);
    });
    
    expect(filter.size()).toBe(5000);
  });

  it('handles very long strings', () => {
    const filter = new BloomFilter(100);
    const longString = 'a'.repeat(10000);
    filter.add(longString);
    expect(filter.has(longString)).toBe(true);
  });

  it('case sensitivity', () => {
    const filter = new BloomFilter(100);
    filter.add('Hello');
    expect(filter.has('Hello')).toBe(true);
    expect(filter.has('hello')).toBe(false);
    expect(filter.has('HELLO')).toBe(false);
  });
});
]=],
  },
  {
    name = "Fenwick Tree",
    difficulty = "medium",
    stub = [=[
/**
 * Fenwick Tree (Binary Indexed Tree)
 *
 * Implement a Fenwick Tree for efficient prefix sum queries and point updates.
 *
 * A Fenwick Tree is more compact than a Segment Tree and faster in practice.
 * It supports:
 * - Point updates in O(log n)
 * - Prefix sum queries in O(log n)
 * - Range sum queries in O(log n)
 *
 * Commonly used for:
 * - Cumulative frequency tables
 * - Inversion counting
 * - Arithmetic coding
 * - Fenwick trees in competitive programming
 *
 * Implement the FenwickTree class with:
 * - constructor(size: number) — Initialize tree for n elements (1-indexed)
 * - update(index: number, delta: number): void — Add delta to element at index
 * - query(index: number): number — Return prefix sum from 1 to index
 * - rangeQuery(left: number, right: number): number — Return sum from left to right
 * - build(arr: number[]): void — Build tree from array in O(n)
 *
 * Note: Fenwick trees use 1-based indexing internally.
 *
 * Bonus: Implement a FenwickTree that supports:
 * - range updates with point queries
 * - 2D Fenwick Tree for matrix operations
 */

export class FenwickTree {
  constructor(size: number) {
    // YOUR CODE HERE
  }

  update(index: number, delta: number): void {
    // YOUR CODE HERE
  }

  query(index: number): number {
    // YOUR CODE HERE
    return 0;
  }

  rangeQuery(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  build(arr: number[]): void {
    // YOUR CODE HERE
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { FenwickTree } from './challenge';

describe('FenwickTree', () => {
  it('creates empty tree', () => {
    const tree = new FenwickTree(5);
    expect(tree.query(1)).toBe(0);
    expect(tree.query(5)).toBe(0);
  });

  it('single element update and query', () => {
    const tree = new FenwickTree(5);
    tree.update(1, 5);
    expect(tree.query(1)).toBe(5);
    expect(tree.query(2)).toBe(5);
    expect(tree.query(5)).toBe(5);
  });

  it('multiple updates', () => {
    const tree = new FenwickTree(5);
    tree.update(1, 1);
    tree.update(2, 2);
    tree.update(3, 3);
    tree.update(4, 4);
    tree.update(5, 5);
    
    expect(tree.query(1)).toBe(1);
    expect(tree.query(2)).toBe(3);
    expect(tree.query(3)).toBe(6);
    expect(tree.query(4)).toBe(10);
    expect(tree.query(5)).toBe(15);
  });

  it('rangeQuery returns correct sums', () => {
    const tree = new FenwickTree(5);
    tree.update(1, 1);
    tree.update(2, 2);
    tree.update(3, 3);
    tree.update(4, 4);
    tree.update(5, 5);
    
    expect(tree.rangeQuery(1, 3)).toBe(6);
    expect(tree.rangeQuery(2, 4)).toBe(9);
    expect(tree.rangeQuery(1, 5)).toBe(15);
    expect(tree.rangeQuery(3, 3)).toBe(3);
  });

  it('build from array', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    
    expect(tree.query(1)).toBe(1);
    expect(tree.query(2)).toBe(3);
    expect(tree.query(3)).toBe(6);
    expect(tree.query(4)).toBe(10);
    expect(tree.query(5)).toBe(15);
  });

  it('update after build', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    tree.update(3, 10); // Add 10 to index 3
    
    expect(tree.query(3)).toBe(16);
    expect(tree.query(5)).toBe(25);
    expect(tree.rangeQuery(3, 3)).toBe(13);
  });

  it('handles negative values', () => {
    const tree = new FenwickTree(5);
    tree.build([1, -2, 3, -4, 5]);
    
    expect(tree.query(1)).toBe(1);
    expect(tree.query(2)).toBe(-1);
    expect(tree.query(3)).toBe(2);
    expect(tree.query(4)).toBe(-2);
    expect(tree.query(5)).toBe(3);
  });

  it('handles zero values', () => {
    const tree = new FenwickTree(5);
    tree.build([0, 0, 0, 0, 0]);
    
    expect(tree.query(5)).toBe(0);
    tree.update(3, 5);
    expect(tree.query(3)).toBe(5);
    expect(tree.query(5)).toBe(5);
  });

  it('single element array', () => {
    const tree = new FenwickTree(1);
    tree.build([42]);
    expect(tree.query(1)).toBe(42);
    tree.update(1, 8);
    expect(tree.query(1)).toBe(50);
  });

  it('large index updates', () => {
    const tree = new FenwickTree(1000);
    tree.update(1000, 100);
    expect(tree.query(999)).toBe(0);
    expect(tree.query(1000)).toBe(100);
  });

  it('stress test with many operations', () => {
    const tree = new FenwickTree(10000);
    const arr = new Array(10000).fill(0);
    
    // Random updates
    for (let i = 0; i < 1000; i++) {
      const idx = Math.floor(Math.random() * 10000) + 1;
      const val = Math.floor(Math.random() * 100) - 50;
      tree.update(idx, val);
      arr[idx - 1] += val;
    }
    
    // Verify prefix sums
    let sum = 0;
    for (let i = 0; i < 10000; i++) {
      sum += arr[i];
      expect(tree.query(i + 1)).toBe(sum);
    }
  });

  it('build is O(n) efficient', () => {
    const tree = new FenwickTree(100000);
    const arr = Array.from({ length: 100000 }, (_, i) => i + 1);
    
    const start = Date.now();
    tree.build(arr);
    const elapsed = Date.now() - start;
    
    expect(elapsed).toBeLessThan(1000); // Should complete in < 1s
    expect(tree.query(100000)).toBe(5000050000); // Sum of 1 to 100000
  });

  it('rangeQuery with left > right returns 0', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    expect(tree.rangeQuery(4, 2)).toBe(0);
  });

  it('query with index 0 returns 0', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    expect(tree.query(0)).toBe(0);
  });

  it('inverse operations', () => {
    const tree = new FenwickTree(5);
    tree.build([1, 2, 3, 4, 5]);
    
    // Add then subtract same value
    tree.update(3, 10);
    tree.update(3, -10);
    
    expect(tree.query(3)).toBe(6);
    expect(tree.query(5)).toBe(15);
  });
});
]=],
  },
  {
    name = "Expression Evaluator",
    difficulty = "medium",
    stub = [=[
/**
 * Expression Evaluator
 *
 * Implement an arithmetic expression evaluator that handles operator precedence.
 *
 * The evaluator must support:
 * - Basic operations: +, -, *, /
 * - Parentheses for grouping
 * - Integer and decimal numbers
 * - Unary minus (negative numbers)
 * - Proper operator precedence (* and / before + and -)
 * - Left-to-right associativity for equal precedence
 *
 * Integer division should truncate toward zero (like JavaScript's | 0).
 *
 * Implement:
 * - evaluate(expression: string): number — Parse and evaluate the expression
 *
 * Examples:
 * - "2 + 3" → 5
 * - "2 + 3 * 4" → 14 (not 20!)
 * - "(2 + 3) * 4" → 20
 * - "10 / 3" → 3 (integer division)
 * - "-5 + 3" → -2
 * - "2 * -3" → -6
 * - "((2 + 3) * 4 - 5) / 3" → 5
 *
 * Bonus: Support additional operators:
 * - Exponentiation: ^ or **
 * - Modulo: %
 * - Variables: "x + y" with context
 */

export function evaluate(expression: string): number {
  // YOUR CODE HERE
  return 0;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { evaluate } from './challenge';

describe('evaluate', () => {
  it('evaluates single number', () => {
    expect(evaluate('42')).toBe(42);
    expect(evaluate('0')).toBe(0);
    expect(evaluate('7')).toBe(7);
  });

  it('evaluates simple addition', () => {
    expect(evaluate('2 + 3')).toBe(5);
    expect(evaluate('10 + 20')).toBe(30);
  });

  it('evaluates simple subtraction', () => {
    expect(evaluate('10 - 3')).toBe(7);
    expect(evaluate('5 - 8')).toBe(-3);
  });

  it('evaluates simple multiplication', () => {
    expect(evaluate('4 * 5')).toBe(20);
    expect(evaluate('3 * 7')).toBe(21);
  });

  it('evaluates simple division', () => {
    expect(evaluate('10 / 2')).toBe(5);
    expect(evaluate('7 / 2')).toBe(3); // Integer division
  });

  it('respects operator precedence', () => {
    expect(evaluate('2 + 3 * 4')).toBe(14);
    expect(evaluate('10 - 2 * 3')).toBe(4);
    expect(evaluate('1 + 2 * 3 + 4')).toBe(11);
  });

  it('handles parentheses', () => {
    expect(evaluate('(2 + 3) * 4')).toBe(20);
    expect(evaluate('2 * (3 + 4)')).toBe(14);
    expect(evaluate('(2 + 3) * (4 + 5)')).toBe(45);
  });

  it('handles nested parentheses', () => {
    expect(evaluate('((2 + 3))')).toBe(5);
    expect(evaluate('((2 + 3) * 4)')).toBe(20);
    expect(evaluate('(((1 + 2) * 3) + 4)')).toBe(13);
  });

  it('handles unary minus', () => {
    expect(evaluate('-5')).toBe(-5);
    expect(evaluate('-5 + 3')).toBe(-2);
    expect(evaluate('5 + -3')).toBe(2);
    expect(evaluate('-5 + -3')).toBe(-8);
  });

  it('handles unary minus with multiplication', () => {
    expect(evaluate('2 * -3')).toBe(-6);
    expect(evaluate('-2 * 3')).toBe(-6);
    expect(evaluate('-2 * -3')).toBe(6);
  });

  it('handles decimal numbers', () => {
    expect(evaluate('2.5 + 3.5')).toBe(6);
    expect(evaluate('10.0 / 2.0')).toBe(5);
  });

  it('handles whitespace', () => {
    expect(evaluate('  2 + 3  ')).toBe(5);
    expect(evaluate('2  +  3')).toBe(5);
    expect(evaluate('  (  2  +  3  )  ')).toBe(5);
  });

  it('complex expressions', () => {
    expect(evaluate('2 + 3 * 4 - 5')).toBe(9);
    expect(evaluate('10 / 2 + 3 * 4')).toBe(17);
    expect(evaluate('(10 + 20) / (3 + 3)')).toBe(5);
    expect(evaluate('((2 + 3) * 4 - 5) / 3')).toBe(5);
  });

  it('division truncates toward zero', () => {
    expect(evaluate('7 / 2')).toBe(3);
    expect(evaluate('-7 / 2')).toBe(-3);
    expect(evaluate('7 / -2')).toBe(-3);
    expect(evaluate('-7 / -2')).toBe(3);
  });

  it('multiple consecutive operations', () => {
    expect(evaluate('1 + 2 + 3 + 4')).toBe(10);
    expect(evaluate('2 * 3 * 4')).toBe(24);
    expect(evaluate('10 - 3 - 2')).toBe(5);
    expect(evaluate('100 / 2 / 5')).toBe(10);
  });

  it('left-to-right associativity', () => {
    expect(evaluate('10 - 5 - 2')).toBe(3); // (10 - 5) - 2
    expect(evaluate('100 / 10 / 2')).toBe(5); // (100 / 10) / 2
  });

  it('zero handling', () => {
    expect(evaluate('0 + 5')).toBe(5);
    expect(evaluate('5 * 0')).toBe(0);
    expect(evaluate('0 / 5')).toBe(0);
  });

  it('large numbers', () => {
    expect(evaluate('1000000 + 2000000')).toBe(3000000);
    expect(evaluate('999999 * 2')).toBe(1999998);
  });

  it('expression with all operators', () => {
    expect(evaluate('10 + 5 * 2 - 8 / 4')).toBe(18);
  });

  it('deeply nested expression', () => {
    expect(evaluate('((((((1 + 2))))))')).toBe(3);
    expect(evaluate('(((1 + 2) * 3) + ((4 * 5) - 6))')).toBe(23);
  });
});

describe('edge cases', () => {
  it('empty expression throws', () => {
    expect(() => evaluate('')).toThrow();
  });

  it('invalid characters throw', () => {
    expect(() => evaluate('2 + a')).toThrow();
    expect(() => evaluate('2 & 3')).toThrow();
  });

  it('unbalanced parentheses throw', () => {
    expect(() => evaluate('(2 + 3')).toThrow();
    expect(() => evaluate('2 + 3)')).toThrow();
  });
});
]=],
  },
  {
    name = "Segment Tree",
    difficulty = "medium",
    stub = [=[
/**
 * Segment Tree
 *
 * Implement a segment tree for efficient range queries and point updates.
 *
 * A segment tree is a binary tree where each node represents an interval/range.
 * It supports:
 * - Point updates in O(log n)
 * - Range queries in O(log n)
 *
 * This implementation should support range sum queries, but design it to be
 * extensible for other operations (min, max, GCD, etc.).
 *
 * Implement the SegmentTree class with:
 * - constructor(arr: number[]) — Build tree from array
 * - update(index: number, value: number): void — Set element at index to value
 * - query(left: number, right: number): number — Return sum from left to right (inclusive)
 * - size(): number — Return the size of the original array
 *
 * The tree uses 0-based indexing for the public API.
 *
 * Bonus: Make it generic with a custom merge function:
 * - constructor(arr: T[], mergeFn: (a: T, b: T) => T, identity: T)
 * - Support range min, range max, range GCD, etc.
 */

export class SegmentTree {
  constructor(arr: number[]) {
    // YOUR CODE HERE
  }

  update(index: number, value: number): void {
    // YOUR CODE HERE
  }

  query(left: number, right: number): number {
    // YOUR CODE HERE
    return 0;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { SegmentTree } from './challenge';

describe('SegmentTree', () => {
  it('creates tree from array', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.size()).toBe(5);
  });

  it('query full range', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 4)).toBe(15);
  });

  it('query single element', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 0)).toBe(1);
    expect(tree.query(2, 2)).toBe(3);
    expect(tree.query(4, 4)).toBe(5);
  });

  it('query partial range', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 2)).toBe(6);
    expect(tree.query(1, 3)).toBe(9);
    expect(tree.query(2, 4)).toBe(12);
  });

  it('update single element', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    tree.update(2, 10);
    expect(tree.query(0, 4)).toBe(22);
    expect(tree.query(2, 2)).toBe(10);
  });

  it('multiple updates', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    tree.update(0, 10);
    tree.update(1, 20);
    tree.update(2, 30);
    expect(tree.query(0, 4)).toBe(64);
  });

  it('update and query interleaved', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(0, 2)).toBe(6);
    tree.update(1, 10);
    expect(tree.query(0, 2)).toBe(14);
    tree.update(2, 20);
    expect(tree.query(0, 2)).toBe(31);
  });

  it('single element array', () => {
    const tree = new SegmentTree([42]);
    expect(tree.query(0, 0)).toBe(42);
    tree.update(0, 100);
    expect(tree.query(0, 0)).toBe(100);
  });

  it('two element array', () => {
    const tree = new SegmentTree([5, 10]);
    expect(tree.query(0, 1)).toBe(15);
    expect(tree.query(0, 0)).toBe(5);
    expect(tree.query(1, 1)).toBe(10);
  });

  it('handles negative values', () => {
    const tree = new SegmentTree([-1, -2, -3, -4, -5]);
    expect(tree.query(0, 4)).toBe(-15);
    tree.update(2, 10);
    expect(tree.query(0, 4)).toBe(0);
  });

  it('handles zero values', () => {
    const tree = new SegmentTree([0, 0, 0, 0, 0]);
    expect(tree.query(0, 4)).toBe(0);
    tree.update(2, 5);
    expect(tree.query(0, 4)).toBe(5);
  });

  it('query with left > right returns 0', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5]);
    expect(tree.query(3, 1)).toBe(0);
  });

  it('query out of bounds throws', () => {
    const tree = new SegmentTree([1, 2, 3]);
    expect(() => tree.query(0, 5)).toThrow();
    expect(() => tree.query(-1, 2)).toThrow();
  });

  it('update out of bounds throws', () => {
    const tree = new SegmentTree([1, 2, 3]);
    expect(() => tree.update(5, 10)).toThrow();
    expect(() => tree.update(-1, 10)).toThrow();
  });

  it('stress test with many operations', () => {
    const arr = Array.from({ length: 1000 }, (_, i) => i + 1);
    const tree = new SegmentTree(arr);
    
    // Initial sum should be sum of 1 to 1000
    expect(tree.query(0, 999)).toBe(500500);
    
    // Random updates and queries
    for (let i = 0; i < 100; i++) {
      const idx = Math.floor(Math.random() * 1000);
      tree.update(idx, i);
    }
    
    // Verify by manual calculation
    let sum = 0;
    for (let i = 0; i < 1000; i++) {
      sum += i < 100 ? (i >= 0 ? i : arr[i]) : arr[i];
    }
    // This is approximate due to random updates
    expect(tree.query(0, 999)).toBeLessThan(500500);
  });

  it('power of 2 size array', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5, 6, 7, 8]);
    expect(tree.query(0, 7)).toBe(36);
    expect(tree.query(0, 3)).toBe(10);
    expect(tree.query(4, 7)).toBe(26);
  });

  it('non-power of 2 size array', () => {
    const tree = new SegmentTree([1, 2, 3, 4, 5, 6, 7]);
    expect(tree.query(0, 6)).toBe(28);
    expect(tree.query(0, 3)).toBe(10);
    expect(tree.query(4, 6)).toBe(18);
  });

  it('large values', () => {
    const tree = new SegmentTree([1000000, 2000000, 3000000]);
    expect(tree.query(0, 2)).toBe(6000000);
  });
});
]=],
  },
  {
    name = "Doubly Linked List",
    difficulty = "easy",
    stub = [=[
/**
 * Doubly Linked List
 *
 * Implement a doubly linked list with forward and backward traversal.
 *
 * A doubly linked list is a linear data structure where each node contains:
 * - A value
 * - A pointer to the next node
 * - A pointer to the previous node
 *
 * This enables:
 * - O(1) append and prepend
 * - O(1) removal from ends
 * - Bidirectional iteration
 *
 * Implement the DoublyLinkedList class with:
 * - constructor() — Create empty list
 * - append(value: T): void — Add to end
 * - prepend(value: T): void — Add to beginning
 * - insert(index: number, value: T): void — Insert at index
 * - remove(index: number): T | null — Remove and return value at index
 * - get(index: number): T | null — Get value at index
 * - set(index: number, value: T): boolean — Set value at index
 * - indexOf(value: T): number — Find first index of value (-1 if not found)
 * - contains(value: T): boolean — Check if value exists
 * - size(): number — Return number of elements
 * - isEmpty(): boolean — Check if list is empty
 * - clear(): void — Remove all elements
 * - toArray(): T[] — Convert to array
 * - toReversedArray(): T[] — Convert to reversed array
 *
 * Bonus: Implement an iterator:
 * - [Symbol.iterator](): Iterator<T>
 */

export class DoublyLinkedList<T> {
  constructor() {
    // YOUR CODE HERE
  }

  append(value: T): void {
    // YOUR CODE HERE
  }

  prepend(value: T): void {
    // YOUR CODE HERE
  }

  insert(index: number, value: T): void {
    // YOUR CODE HERE
  }

  remove(index: number): T | null {
    // YOUR CODE HERE
    return null;
  }

  get(index: number): T | null {
    // YOUR CODE HERE
    return null;
  }

  set(index: number, value: T): boolean {
    // YOUR CODE HERE
    return false;
  }

  indexOf(value: T): number {
    // YOUR CODE HERE
    return -1;
  }

  contains(value: T): boolean {
    // YOUR CODE HERE
    return false;
  }

  size(): number {
    // YOUR CODE HERE
    return 0;
  }

  isEmpty(): boolean {
    // YOUR CODE HERE
    return true;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  toArray(): T[] {
    // YOUR CODE HERE
    return [];
  }

  toReversedArray(): T[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { DoublyLinkedList } from './challenge';

describe('DoublyLinkedList', () => {
  it('creates empty list', () => {
    const list = new DoublyLinkedList();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
  });

  it('append single element', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.size()).toBe(1);
    expect(list.get(0)).toBe(1);
  });

  it('append multiple elements', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('prepend single element', () => {
    const list = new DoublyLinkedList();
    list.prepend(1);
    expect(list.get(0)).toBe(1);
    expect(list.size()).toBe(1);
  });

  it('prepend multiple elements', () => {
    const list = new DoublyLinkedList();
    list.prepend(1);
    list.prepend(2);
    list.prepend(3);
    expect(list.toArray()).toEqual([3, 2, 1]);
  });

  it('mix append and prepend', () => {
    const list = new DoublyLinkedList();
    list.append(2);
    list.prepend(1);
    list.append(3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insert at beginning', () => {
    const list = new DoublyLinkedList();
    list.append(2);
    list.append(3);
    list.insert(0, 1);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insert at end', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.insert(2, 3);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('insert in middle', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(3);
    list.insert(1, 2);
    expect(list.toArray()).toEqual([1, 2, 3]);
  });

  it('remove from beginning', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.remove(0)).toBe(1);
    expect(list.toArray()).toEqual([2, 3]);
  });

  it('remove from end', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.remove(2)).toBe(3);
    expect(list.toArray()).toEqual([1, 2]);
  });

  it('remove from middle', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.remove(1)).toBe(2);
    expect(list.toArray()).toEqual([1, 3]);
  });

  it('remove returns null for invalid index', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.remove(5)).toBeNull();
    expect(list.remove(-1)).toBeNull();
  });

  it('get returns null for invalid index', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.get(5)).toBeNull();
    expect(list.get(-1)).toBeNull();
  });

  it('set updates value', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    expect(list.set(0, 10)).toBe(true);
    expect(list.get(0)).toBe(10);
  });

  it('set returns false for invalid index', () => {
    const list = new DoublyLinkedList();
    expect(list.set(0, 1)).toBe(false);
  });

  it('indexOf finds elements', () => {
    const list = new DoublyLinkedList();
    list.append('a');
    list.append('b');
    list.append('c');
    expect(list.indexOf('a')).toBe(0);
    expect(list.indexOf('b')).toBe(1);
    expect(list.indexOf('c')).toBe(2);
  });

  it('indexOf returns -1 for missing element', () => {
    const list = new DoublyLinkedList();
    list.append('a');
    expect(list.indexOf('b')).toBe(-1);
  });

  it('contains checks existence', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(list.contains(1)).toBe(true);
    expect(list.contains(2)).toBe(false);
  });

  it('clear empties list', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.clear();
    expect(list.isEmpty()).toBe(true);
    expect(list.size()).toBe(0);
    expect(list.toArray()).toEqual([]);
  });

  it('toReversedArray returns reversed copy', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    list.append(2);
    list.append(3);
    expect(list.toReversedArray()).toEqual([3, 2, 1]);
    expect(list.toArray()).toEqual([1, 2, 3]); // Original unchanged
  });

  it('handles generic types', () => {
    const list = new DoublyLinkedList<string>();
    list.append('hello');
    list.append('world');
    expect(list.toArray()).toEqual(['hello', 'world']);
  });

  it('handles object values', () => {
    const list = new DoublyLinkedList<{ id: number }>();
    list.append({ id: 1 });
    list.append({ id: 2 });
    expect(list.get(0)?.id).toBe(1);
    expect(list.get(1)?.id).toBe(2);
  });

  it('stress test with many operations', () => {
    const list = new DoublyLinkedList();
    for (let i = 0; i < 100; i++) {
      list.append(i);
    }
    expect(list.size()).toBe(100);
    expect(list.get(0)).toBe(0);
    expect(list.get(99)).toBe(99);
    
    for (let i = 0; i < 50; i++) {
      list.remove(0);
    }
    expect(list.size()).toBe(50);
    expect(list.get(0)).toBe(50);
  });

  it('insert at invalid index throws', () => {
    const list = new DoublyLinkedList();
    list.append(1);
    expect(() => list.insert(5, 2)).toThrow();
    expect(() => list.insert(-1, 2)).toThrow();
  });
});
]=],
  },
  {
    name = "Topological Sort",
    difficulty = "medium",
    stub = [=[
/**
 * Topological Sort
 *
 * Implement topological sorting for directed acyclic graphs (DAGs).
 *
 * Topological sort orders vertices such that for every directed edge (u, v),
 * vertex u comes before v in the ordering. This is essential for:
 * - Build systems (dependency resolution)
 * - Package managers (npm, pip, cargo)
 * - Course scheduling (prerequisites)
 * - Task scheduling with dependencies
 * - Deadlock detection
 *
 * Implement:
 * - topologicalSort(graph: Map<number, number[]>): number[] | null
 *   Return a valid topological order, or null if graph has a cycle.
 *   Use either Kahn's algorithm (BFS-based) or DFS-based approach.
 *
 * - hasCycle(graph: Map<number, number[]>): boolean
 *   Detect if the graph contains a cycle.
 *
 * - findCourseOrder(numCourses: number, prerequisites: number[][]): number[] | null
 *   Classic course schedule problem: given numCourses and prerequisites
 *   where [a, b] means "b must be taken before a", return a valid order.
 *
 * Graph representation: adjacency list as Map<vertex, neighbors[]>
 *
 * Bonus: Implement allSourcesTopologicalSort to find all valid orderings.
 */

export function topologicalSort(graph: Map<number, number[]>): number[] | null {
  // YOUR CODE HERE
  return null;
}

export function hasCycle(graph: Map<number, number[]>): boolean {
  // YOUR CODE HERE
  return false;
}

export function findCourseOrder(numCourses: number, prerequisites: number[][]): number[] | null {
  // YOUR CODE HERE
  return null;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { topologicalSort, hasCycle, findCourseOrder } from './challenge';

function isValidTopoOrder(graph: Map<number, number[]>, order: number[]): boolean {
  const position = new Map<number, number>();
  order.forEach((v, i) => position.set(v, i));
  
  for (const [u, neighbors] of graph.entries()) {
    for (const v of neighbors) {
      if ((position.get(u) ?? -1) >= (position.get(v) ?? 0)) {
        return false;
      }
    }
  }
  return true;
}

describe('topologicalSort', () => {
  it('empty graph', () => {
    const graph = new Map();
    expect(topologicalSort(graph)).toEqual([]);
  });

  it('single node', () => {
    const graph = new Map([[0, []]]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toEqual([0]);
  });

  it('linear chain 0 -> 1 -> 2 -> 3', () => {
    const graph = new Map([
      [0, [1]],
      [1, [2]],
      [2, [3]],
      [3, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).toEqual([0, 1, 2, 3]);
  });

  it('simple DAG', () => {
    const graph = new Map([
      [0, [1, 2]],
      [1, [3]],
      [2, [3]],
      [3, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });

  it('graph with cycle returns null', () => {
    const graph = new Map([
      [0, [1]],
      [1, [2]],
      [2, [0]]
    ]);
    expect(topologicalSort(graph)).toBeNull();
  });

  it('self-loop is a cycle', () => {
    const graph = new Map([[0, [0]]]);
    expect(topologicalSort(graph)).toBeNull();
  });

  it('disconnected components', () => {
    const graph = new Map([
      [0, [1]],
      [1, []],
      [2, [3]],
      [3, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(4);
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });

  it('multiple valid orderings', () => {
    const graph = new Map([
      [0, []],
      [1, []],
      [2, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(3);
    expect(new Set(result)).toEqual(new Set([0, 1, 2]));
  });

  it('complex DAG', () => {
    const graph = new Map([
      [0, [1, 2]],
      [1, [3]],
      [2, [3, 4]],
      [3, [5]],
      [4, [5]],
      [5, []]
    ]);
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });

  it('large linear chain', () => {
    const graph = new Map<number, number[]>();
    for (let i = 0; i < 100; i++) {
      graph.set(i, [i + 1]);
    }
    graph.set(100, []);
    
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(101);
    expect(result![0]).toBe(0);
    expect(result![100]).toBe(100);
  });
});

describe('hasCycle', () => {
  it('empty graph has no cycle', () => {
    expect(hasCycle(new Map())).toBe(false);
  });

  it('single node has no cycle', () => {
    expect(hasCycle(new Map([[0, []]]))).toBe(false);
  });

  it('simple cycle 0 -> 1 -> 0', () => {
    const graph = new Map([
      [0, [1]],
      [1, [0]]
    ]);
    expect(hasCycle(graph)).toBe(true);
  });

  it('larger cycle', () => {
    const graph = new Map([
      [0, [1]],
      [1, [2]],
      [2, [3]],
      [3, [0]]
    ]);
    expect(hasCycle(graph)).toBe(true);
  });

  it('self-loop', () => {
    const graph = new Map([[0, [0]]]);
    expect(hasCycle(graph)).toBe(true);
  });

  it('no cycle in DAG', () => {
    const graph = new Map([
      [0, [1, 2]],
      [1, [3]],
      [2, [3]],
      [3, []]
    ]);
    expect(hasCycle(graph)).toBe(false);
  });

  it('disconnected with cycle in one component', () => {
    const graph = new Map([
      [0, [1]],
      [1, []],
      [2, [3]],
      [3, [2]] // Cycle in this component
    ]);
    expect(hasCycle(graph)).toBe(true);
  });
});

describe('findCourseOrder', () => {
  it('no prerequisites', () => {
    const result = findCourseOrder(2, []);
    expect(result).not.toBeNull();
    expect(new Set(result)).toEqual(new Set([0, 1]));
  });

  it('single prerequisite 1 -> 0', () => {
    const result = findCourseOrder(2, [[1, 0]]);
    expect(result).toEqual([0, 1]);
  });

  it('multiple prerequisites', () => {
    const result = findCourseOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]]);
    expect(result).not.toBeNull();
    expect(result![0]).toBe(0);
    expect(result!.indexOf(1)).toBeLessThan(result!.indexOf(3));
    expect(result!.indexOf(2)).toBeLessThan(result!.indexOf(3));
  });

  it('impossible with cycle', () => {
    const result = findCourseOrder(2, [[1, 0], [0, 1]]);
    expect(result).toBeNull();
  });

  it('complex valid ordering', () => {
    const result = findCourseOrder(6, [
      [1, 0],
      [2, 0],
      [3, 1],
      [3, 2],
      [4, 3],
      [5, 3]
    ]);
    expect(result).not.toBeNull();
    expect(isValidTopoOrder(
      new Map([
        [0, [1, 2]],
        [1, [3]],
        [2, [3]],
        [3, [4, 5]],
        [4, []],
        [5, []]
      ]),
      result!
    )).toBe(true);
  });

  it('all courses depend on one', () => {
    const result = findCourseOrder(4, [[1, 0], [2, 0], [3, 0]]);
    expect(result).not.toBeNull();
    expect(result![0]).toBe(0);
    expect(new Set(result!.slice(1))).toEqual(new Set([1, 2, 3]));
  });

  it('linear chain of prerequisites', () => {
    const result = findCourseOrder(4, [[1, 0], [2, 1], [3, 2]]);
    expect(result).toEqual([0, 1, 2, 3]);
  });
});

describe('performance', () => {
  it('handles larger graph', () => {
    const graph = new Map<number, number[]>();
    for (let i = 0; i < 100; i++) {
      graph.set(i, [i + 1]);
    }
    graph.set(100, []);
    
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(101);
  });

  it('handles dense DAG', () => {
    const graph = new Map<number, number[]>();
    const n = 50;
    for (let i = 0; i < n; i++) {
      const neighbors: number[] = [];
      for (let j = i + 1; j < n; j++) {
        neighbors.push(j);
      }
      graph.set(i, neighbors);
    }
    
    const result = topologicalSort(graph);
    expect(result).not.toBeNull();
    expect(result).toHaveLength(n);
    expect(isValidTopoOrder(graph, result!)).toBe(true);
  });
});
]=],
  },
  {
    name = "Monadic Option/Maybe Type",
    difficulty = "medium",
    stub = [=[
/**
 * Monadic Option/Maybe Type
 *
 * Implement a functional Option (Maybe) type for safe error handling without exceptions.
 *
 * The Option type represents a value that may or may not exist:
 * - Some(value) — A value is present
 * - None — No value is present
 *
 * This pattern is common in functional programming (Rust, Scala, Haskell) and helps:
 * - Avoid null/undefined errors
 * - Chain operations safely
 * - Make absence of values explicit in the type system
 * - Compose operations that might fail
 *
 * Implement:
 * - abstract class Option<T> — Base type
 * - class Some<T> extends Option<T> — Represents a present value
 * - class None<T> extends Option<T> — Represents absence (singleton pattern)
 *
 * Option methods:
 * - map<U>(fn: (value: T) => U): Option<U> — Transform the value if present
 * - flatMap<U>(fn: (value: T) => Option<U>): Option<U> — Chain Option-returning functions
 * - filter(predicate: (value: T) => boolean): Option<T> — Keep value only if predicate passes
 * - getOrElse(defaultValue: T): T — Get value or return default
 * - getOrThrow(error?: Error): T — Get value or throw
 * - isSome(): boolean — Check if value is present
 * - isNone(): boolean — Check if value is absent
 * - orElse(other: Option<T>): Option<T> — Use other if this is None
 * - orElseGet(fn: () => Option<T>): Option<T> — Lazy version of orElse
 * - forEach(fn: (value: T) => void): void — Execute side effect if present
 * - toArray(): T[] — Convert to array (empty if None, single-element if Some)
 *
 * Static helpers:
 * - Option.of<T>(value: T | null | undefined): Option<T> — Create from nullable
 * - Option.some<T>(value: T): Option<T> — Create Some explicitly
 * - Option.none<T>(): Option<T> — Create None (singleton)
 * - Option.fromNullable<T>(value: T | null | undefined): Option<T> — Alias for of
 *
 * Bonus: Implement additional combinators:
 * - zip<U>(other: Option<U>): Option<[T, U]> — Combine two Options
 * - first<U>(other: Option<U>): Option<T> — Return this if both are Some
 * - second<U>(other: Option<U>): Option<U> — Return other if both are Some
 */

export abstract class Option<T> {
  abstract map<U>(fn: (value: T) => U): Option<U>;
  abstract flatMap<U>(fn: (value: T) => Option<U>): Option<U>;
  abstract filter(predicate: (value: T) => boolean): Option<T>;
  abstract getOrElse(defaultValue: T): T;
  abstract getOrThrow(error?: Error): T;
  abstract isSome(): boolean;
  abstract isNone(): boolean;
  abstract orElse(other: Option<T>): Option<T>;
  abstract orElseGet(fn: () => Option<T>): Option<T>;
  abstract forEach(fn: (value: T) => void): void;
  abstract toArray(): T[];
  
  static of<T>(value: T | null | undefined): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  static some<T>(value: T): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  static none<T>(): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  static fromNullable<T>(value: T | null | undefined): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
}

export class Some<T> extends Option<T> {
  constructor(value: T) {
    // YOUR CODE HERE
    super();
  }
  
  map<U>(fn: (value: T) => U): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  flatMap<U>(fn: (value: T) => Option<U>): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  filter(predicate: (value: T) => boolean): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  getOrElse(defaultValue: T): T {
    // YOUR CODE HERE
    return defaultValue;
  }
  
  getOrThrow(error?: Error): T {
    // YOUR CODE HERE
    throw error ?? new Error('Unexpected None');
  }
  
  isSome(): boolean {
    // YOUR CODE HERE
    return false;
  }
  
  isNone(): boolean {
    // YOUR CODE HERE
    return true;
  }
  
  orElse(other: Option<T>): Option<T> {
    // YOUR CODE HERE
    return other;
  }
  
  orElseGet(fn: () => Option<T>): Option<T> {
    // YOUR CODE HERE
    return fn();
  }
  
  forEach(fn: (value: T) => void): void {
    // YOUR CODE HERE
  }
  
  toArray(): T[] {
    // YOUR CODE HERE
    return [];
  }
}

export class None<T> extends Option<T> {
  map<U>(fn: (value: T) => U): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  flatMap<U>(fn: (value: T) => Option<U>): Option<U> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  filter(predicate: (value: T) => boolean): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  getOrElse(defaultValue: T): T {
    // YOUR CODE HERE
    return defaultValue;
  }
  
  getOrThrow(error?: Error): T {
    // YOUR CODE HERE
    throw error ?? new Error('Attempted to get value from None');
  }
  
  isSome(): boolean {
    // YOUR CODE HERE
    return true;
  }
  
  isNone(): boolean {
    // YOUR CODE HERE
    return false;
  }
  
  orElse(other: Option<T>): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  orElseGet(fn: () => Option<T>): Option<T> {
    // YOUR CODE HERE
    return Option.none();
  }
  
  forEach(fn: (value: T) => void): void {
    // YOUR CODE HERE
  }
  
  toArray(): T[] {
    // YOUR CODE HERE
    return [];
  }
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { Option, Some, None } from './challenge';

describe('Option', () => {
  describe('static methods', () => {
    it('Option.of creates Some for non-null values', () => {
      expect(Option.of(42).isSome()).toBe(true);
      expect(Option.of('hello').isSome()).toBe(true);
      expect(Option.of(0).isSome()).toBe(true);
      expect(Option.of(false).isSome()).toBe(true);
      expect(Option.of('').isSome()).toBe(true);
    });

    it('Option.of creates None for null/undefined', () => {
      expect(Option.of(null).isNone()).toBe(true);
      expect(Option.of(undefined).isNone()).toBe(true);
    });

    it('Option.some creates Some', () => {
      const some = Option.some(42);
      expect(some.isSome()).toBe(true);
      expect(some.isNone()).toBe(false);
    });

    it('Option.none creates None', () => {
      const none = Option.none();
      expect(none.isNone()).toBe(true);
      expect(none.isSome()).toBe(false);
    });

    it('Option.fromNullable is alias for of', () => {
      expect(Option.fromNullable(42).isSome()).toBe(true);
      expect(Option.fromNullable(null).isNone()).toBe(true);
    });
  });

  describe('Some', () => {
    it('map transforms value', () => {
      const result = Option.some(5).map(x => x * 2);
      expect(result.getOrElse(0)).toBe(10);
    });

    it('map chains multiple transformations', () => {
      const result = Option.some('hello')
        .map(s => s.toUpperCase())
        .map(s => s.length);
      expect(result.getOrElse(0)).toBe(5);
    });

    it('flatMap chains Option-returning functions', () => {
      const safeDivide = (a: number, b: number): Option<number> =>
        b === 0 ? Option.none() : Option.some(a / b);
      
      const result = Option.some(10)
        .flatMap(x => safeDivide(x, 2))
        .flatMap(x => safeDivide(x, 5));
      expect(result.getOrElse(0)).toBe(1);
    });

    it('flatMap returns None when function returns None', () => {
      const result = Option.some(10)
        .flatMap(() => Option.none<number>());
      expect(result.isNone()).toBe(true);
    });

    it('filter keeps value when predicate passes', () => {
      const result = Option.some(10).filter(x => x > 5);
      expect(result.isSome()).toBe(true);
    });

    it('filter returns None when predicate fails', () => {
      const result = Option.some(10).filter(x => x > 20);
      expect(result.isNone()).toBe(true);
    });

    it('getOrElse returns value for Some', () => {
      expect(Option.some(42).getOrElse(0)).toBe(42);
    });

    it('getOrThrow returns value for Some', () => {
      expect(Option.some(42).getOrThrow()).toBe(42);
    });

    it('orElse returns this for Some', () => {
      const result = Option.some(42).orElse(Option.some(99));
      expect(result.getOrElse(0)).toBe(42);
    });

    it('orElseGet does not evaluate fn for Some', () => {
      let called = false;
      const result = Option.some(42).orElseGet(() => {
        called = true;
        return Option.some(99);
      });
      expect(called).toBe(false);
      expect(result.getOrElse(0)).toBe(42);
    });

    it('forEach executes for Some', () => {
      let value: number | undefined;
      Option.some(42).forEach(v => { value = v; });
      expect(value).toBe(42);
    });

    it('toArray returns single-element array', () => {
      expect(Option.some(42).toArray()).toEqual([42]);
    });

    it('isSome returns true', () => {
      expect(Option.some(42).isSome()).toBe(true);
    });

    it('isNone returns false', () => {
      expect(Option.some(42).isNone()).toBe(false);
    });
  });

  describe('None', () => {
    it('map returns None', () => {
      const result = Option.none<number>().map(x => x * 2);
      expect(result.isNone()).toBe(true);
    });

    it('flatMap returns None', () => {
      const result = Option.none<number>().flatMap(x => Option.some(x * 2));
      expect(result.isNone()).toBe(true);
    });

    it('filter returns None', () => {
      const result = Option.none<number>().filter(() => true);
      expect(result.isNone()).toBe(true);
    });

    it('getOrElse returns default', () => {
      expect(Option.none<number>().getOrElse(42)).toBe(42);
    });

    it('getOrThrow throws', () => {
      expect(() => Option.none<number>().getOrThrow()).toThrow();
    });

    it('getOrThrow with custom error', () => {
      const customError = new Error('custom');
      try {
        Option.none<number>().getOrThrow(customError);
        expect.fail('Should have thrown');
      } catch (e) {
        expect(e).toBe(customError);
      }
    });

    it('orElse returns other', () => {
      const result = Option.none<number>().orElse(Option.some(42));
      expect(result.getOrElse(0)).toBe(42);
    });

    it('orElseGet evaluates fn', () => {
      let called = false;
      const result = Option.none<number>().orElseGet(() => {
        called = true;
        return Option.some(42);
      });
      expect(called).toBe(true);
      expect(result.getOrElse(0)).toBe(42);
    });

    it('forEach does not execute', () => {
      let called = false;
      Option.none<number>().forEach(() => { called = true; });
      expect(called).toBe(false);
    });

    it('toArray returns empty array', () => {
      expect(Option.none<number>().toArray()).toEqual([]);
    });

    it('isSome returns false', () => {
      expect(Option.none<number>().isSome()).toBe(false);
    });

    it('isNone returns true', () => {
      expect(Option.none<number>().isNone()).toBe(true);
    });
  });

  describe('chaining', () => {
    it('complex chain with Some', () => {
      const result = Option.some('  hello  ')
        .map(s => s.trim())
        .filter(s => s.length > 3)
        .map(s => s.toUpperCase())
        .getOrElse('DEFAULT');
      expect(result).toBe('HELLO');
    });

    it('chain breaks with None', () => {
      const result = Option.some('  hi  ')
        .map(s => s.trim())
        .filter(s => s.length > 3) // This returns None
        .map(s => s.toUpperCase()) // This is skipped
        .getOrElse('DEFAULT');
      expect(result).toBe('DEFAULT');
    });

    it('flatMap with failing operation', () => {
      const findUser = (id: number): Option<{ id: number; name: string }> =>
        id === 1 ? Option.some({ id: 1, name: 'Alice' }) : Option.none();
      
      const getUserEmail = (user: { id: number; name: string }): Option<string> =>
        user.name === 'Alice' ? Option.some('alice@example.com') : Option.none();
      
      const result = Option.some(1)
        .flatMap(findUser)
        .flatMap(getUserEmail)
        .getOrElse('no-email');
      expect(result).toBe('alice@example.com');
    });

    it('flatMap with missing user', () => {
      const findUser = (id: number): Option<{ id: number; name: string }> =>
        id === 1 ? Option.some({ id: 1, name: 'Alice' }) : Option.none();
      
      const result = Option.some(999)
        .flatMap(findUser)
        .flatMap(user => Option.some(user.name))
        .getOrElse('Unknown');
      expect(result).toBe('Unknown');
    });
  });

  describe('edge cases', () => {
    it('handles falsy values in Some', () => {
      expect(Option.some(0).getOrElse(99)).toBe(0);
      expect(Option.some(false).getOrElse(true)).toBe(false);
      expect(Option.some('').getOrElse('default')).toBe('');
      expect(Option.some(null as any).getOrElse('default')).toBe(null);
    });

    it('None singleton behavior', () => {
      const none1 = Option.none<number>();
      const none2 = Option.none<string>();
      // None should be singleton per type, but implementation may vary
      expect(none1.isNone()).toBe(true);
      expect(none2.isNone()).toBe(true);
    });

    it('nested Options', () => {
      const nested = Option.some(Option.some(42));
      const result = nested.flatMap(x => x);
      expect(result.getOrElse(0)).toBe(42);
    });

    it('map with expensive computation (lazy)', () => {
      let computed = false;
      const none = Option.none<number>();
      none.map(() => {
        computed = true;
        return 42;
      });
      expect(computed).toBe(false); // Should not compute for None
    });
  });

  describe('real-world scenarios', () => {
    it('parsing integers safely', () => {
      const parseIntSafe = (s: string): Option<number> => {
        const parsed = parseInt(s, 10);
        return isNaN(parsed) ? Option.none() : Option.some(parsed);
      };
      
      expect(parseIntSafe('42').getOrElse(0)).toBe(42);
      expect(parseIntSafe('not-a-number').getOrElse(0)).toBe(0);
    });

    it('finding array element safely', () => {
      const findFirst = <T>(arr: T[], predicate: (t: T) => boolean): Option<T> => {
        const found = arr.find(predicate);
        return Option.of(found);
      };
      
      const numbers = [1, 2, 3, 4, 5];
      expect(findFirst(numbers, n => n > 3).getOrElse(0)).toBe(4);
      expect(findFirst(numbers, n => n > 10).getOrElse(0)).toBe(0);
    });

    it('object property access', () => {
      const getUser = (): Option<{ name: string }> => Option.none();
      
      const result = getUser()
        .map(u => u.name)
        .getOrElse('Anonymous');
      expect(result).toBe('Anonymous');
    });

    it('division with error handling', () => {
      const safeDivide = (a: number, b: number): Option<number> =>
        b === 0 ? Option.none() : Option.some(a / b);
      
      expect(safeDivide(10, 2).getOrElse(0)).toBe(5);
      expect(safeDivide(10, 0).getOrElse(-1)).toBe(-1);
    });
  });
});
]=],
  },
  {
    name = "Middleware Chain",
    difficulty = "medium",
    stub = [==[
/**
 * Middleware Chain
 *
 * Implement a middleware composition system like Express.js, Koa, or Redux.
 *
 * Middleware functions are composable handlers that execute in sequence,
 * each receiving a context object and a `next` function to pass control
 * to the downstream middleware. This pattern enables:
 * - Request/response processing pipelines
 * - Authentication and authorization layers
 * - Logging, error handling, CORS
 * - Plugin and extension systems
 *
 * Implement the MiddlewareChain class with:
 * - constructor() — Initialize an empty middleware chain
 * - use(middleware: MiddlewareFn): MiddlewareChain — Add middleware to the chain.
 *   Returns this for chaining. Middleware receives (ctx, next) where:
 *   - ctx is a context object that middleware can read/modify
 *   - next() is a function that calls the next middleware in the chain
 * - run(ctx: object): Promise<void> — Execute all middleware in order.
 *   Each middleware must call next() to continue, unless it's terminal.
 * - onError(handler: (ctx: object, error: Error) => void | Promise<void>): MiddlewareChain
 *   Register an error handler. If any middleware throws, the error handler runs.
 * - clear(): void — Remove all middleware and error handlers.
 * - length(): number — Return the number of middleware in the chain.
 *
 * The chain should support async middleware and proper error propagation.
 * If a middleware doesn't call next(), the chain stops there.
 *
 * Bonus: Implement branched middleware with `when(condition, middleware)`
 * that only runs if the condition function returns true.
 */

export interface Context {
  [key: string]: any;
}

export type NextFn = () => Promise<void>;

export type MiddlewareFn = (ctx: Context, next: NextFn) => void | Promise<void>;

export type ErrorHandler = (ctx: Context, error: Error) => void | Promise<void>;

export class MiddlewareChain {
  constructor() {
    // YOUR CODE HERE
  }

  use(middleware: MiddlewareFn): MiddlewareChain {
    // YOUR CODE HERE
    return this;
  }

  async run(ctx: Context): Promise<void> {
    // YOUR CODE HERE
  }

  onError(handler: ErrorHandler): MiddlewareChain {
    // YOUR CODE HERE
    return this;
  }

  clear(): void {
    // YOUR CODE HERE
  }

  length(): number {
    // YOUR CODE HERE
    return 0;
  }

  when(condition: (ctx: Context) => boolean, middleware: MiddlewareFn): MiddlewareChain {
    // YOUR CODE HERE
    return this;
  }
}
]==],
    tests = [==[
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { MiddlewareChain, Context } from './challenge';

describe('MiddlewareChain', () => {
  let chain: MiddlewareChain;

  beforeEach(() => {
    chain = new MiddlewareChain();
  });

  it('runs middleware in order', async () => {
    const execution: number[] = [];
    chain.use(async (ctx, next) => {
      execution.push(1);
      await next();
      execution.push(10);
    });
    chain.use(async (ctx, next) => {
      execution.push(2);
      await next();
      execution.push(9);
    });
    chain.use(async (ctx, next) => {
      execution.push(3);
      await next();
      execution.push(8);
    });

    await chain.run({});
    expect(execution).toEqual([1, 2, 3, 8, 9, 10]);
  });

  it('passes context through middleware', async () => {
    chain.use(async (ctx, next) => {
      ctx.value1 = 'first';
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.value2 = 'second';
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.value3 = 'third';
      await next();
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(ctx).toEqual({ value1: 'first', value2: 'second', value3: 'third' });
  });

  it('supports middleware that does not call next', async () => {
    const execution: number[] = [];
    chain.use(async (ctx, next) => {
      execution.push(1);
      await next();
      execution.push(10);
    });
    chain.use(async (ctx, next) => {
      execution.push(2);
      // Does not call next - chain stops here
      execution.push(9);
    });
    chain.use(async (ctx, next) => {
      execution.push(3);
      await next();
    });

    await chain.run({});
    expect(execution).toEqual([1, 2, 9, 10]);
  });

  it('returns this from use for chaining', () => {
    const result = chain.use(async (ctx, next) => {});
    expect(result).toBe(chain);
  });

  it('handles async middleware', async () => {
    const execution: string[] = [];
    chain.use(async (ctx, next) => {
      execution.push('start');
      await new Promise(resolve => setTimeout(resolve, 10));
      await next();
      execution.push('end');
    });
    chain.use(async (ctx, next) => {
      execution.push('middle');
      await next();
    });

    await chain.run({});
    expect(execution).toEqual(['start', 'middle', 'end']);
  });

  it('catches errors with onError handler', async () => {
    const error = new Error('test error');
    let caughtError: Error | null = null;
    let errorCtx: Context | null = null;

    chain.use(async (ctx, next) => {
      ctx.before = true;
      await next();
    });
    chain.use(async () => {
      throw error;
    });
    chain.use(async (ctx) => {
      ctx.after = true; // Should not run
    });
    chain.onError((ctx, err) => {
      caughtError = err;
      errorCtx = ctx;
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(caughtError).toBe(error);
    expect(errorCtx?.before).toBe(true);
    expect(ctx.after).toBeUndefined();
  });

  it('onError returns this for chaining', () => {
    const result = chain.onError(() => {});
    expect(result).toBe(chain);
  });

  it('multiple error handlers all run', async () => {
    const errors: Error[] = [];
    chain.use(async () => {
      throw new Error('test');
    });
    chain.onError(() => { errors.push(new Error('handler1')); });
    chain.onError(() => { errors.push(new Error('handler2')); });

    await chain.run({});
    expect(errors).toHaveLength(2);
  });

  it('clear removes all middleware', async () => {
    const execution: number[] = [];
    chain.use(async (ctx, next) => { execution.push(1); await next(); });
    chain.use(async (ctx, next) => { execution.push(2); await next(); });
    chain.clear();
    chain.use(async (ctx, next) => { execution.push(3); await next(); });

    await chain.run({});
    expect(execution).toEqual([3]);
  });

  it('length returns middleware count', () => {
    expect(chain.length()).toBe(0);
    chain.use(async (ctx, next) => {});
    expect(chain.length()).toBe(1);
    chain.use(async (ctx, next) => {});
    expect(chain.length()).toBe(2);
    chain.clear();
    expect(chain.length()).toBe(0);
  });

  it('when conditionally runs middleware', async () => {
    const execution: string[] = [];
    chain.when(ctx => ctx.run === true, async (ctx, next) => {
      execution.push('conditional');
      await next();
    });
    chain.use(async (ctx, next) => {
      execution.push('always');
      await next();
    });

    await chain.run({ run: true });
    expect(execution).toEqual(['conditional', 'always']);

    execution.length = 0;
    await chain.run({ run: false });
    expect(execution).toEqual(['always']);
  });

  it('when with false condition skips middleware', async () => {
    chain.use(async (ctx, next) => {
      ctx.skipped = true;
      await next();
    });
    chain.when(() => false, async (ctx) => {
      ctx.shouldNotRun = true;
    });
    chain.use(async (ctx, next) => {
      ctx.after = true;
      await next();
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(ctx.skipped).toBe(true);
    expect(ctx.after).toBe(true);
    expect(ctx.shouldNotRun).toBeUndefined();
  });

  it('empty chain runs without error', async () => {
    await expect(chain.run({})).resolves.toBeUndefined();
  });

  it('error in middleware after next() is caught', async () => {
    let caughtError: Error | null = null;
    chain.use(async (ctx, next) => {
      await next();
      throw new Error('after next');
    });
    chain.use(async (ctx, next) => {
      await next();
    });
    chain.onError((ctx, err) => {
      caughtError = err;
    });

    await chain.run({});
    expect(caughtError?.message).toBe('after next');
  });

  it('can modify context in multiple middleware', async () => {
    chain.use(async (ctx, next) => {
      ctx.count = (ctx.count || 0) + 1;
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.count = (ctx.count || 0) + 1;
      await next();
    });
    chain.use(async (ctx, next) => {
      ctx.count = (ctx.count || 0) + 1;
      await next();
    });

    const ctx: Context = { count: 0 };
    await chain.run(ctx);
    expect(ctx.count).toBe(3);
  });

  it('supports synchronous middleware', async () => {
    const execution: number[] = [];
    chain.use((ctx, next) => {
      execution.push(1);
      next();
      execution.push(10);
    });
    chain.use((ctx, next) => {
      execution.push(2);
      next();
      execution.push(9);
    });

    await chain.run({});
    expect(execution).toEqual([1, 2, 9, 10]);
  });

  it('error handler can fix and continue', async () => {
    let recovered = false;
    chain.use(async (ctx, next) => {
      try {
        await next();
      } catch (err) {
        ctx.recovered = true;
        recovered = true;
      }
    });
    chain.use(async () => {
      throw new Error('fail');
    });

    const ctx: Context = {};
    await chain.run(ctx);
    expect(recovered).toBe(true);
    expect(ctx.recovered).toBe(true);
  });

  it('complex middleware composition', async () => {
    const log: string[] = [];
    
    chain.use(async (ctx, next) => {
      log.push('auth-start');
      ctx.authenticated = true;
      await next();
      log.push('auth-end');
    });
    
    chain.when(ctx => ctx.authenticated, async (ctx, next) => {
      log.push('check-permissions');
      ctx.hasPermission = true;
      await next();
    });
    
    chain.use(async (ctx, next) => {
      log.push('logger-start');
      await next();
      log.push('logger-end');
    });
    
    chain.onError((ctx, err) => {
      log.push(`error: ${err.message}`);
    });

    await chain.run({});
    expect(log).toEqual([
      'auth-start',
      'check-permissions',
      'logger-start',
      'logger-end',
      'auth-end'
    ]);
  });

  it('stress test with many middleware', async () => {
    const execution: number[] = [];
    for (let i = 0; i < 50; i++) {
      chain.use(async (ctx, next) => {
        execution.push(i);
        await next();
        execution.push(100 + i);
      });
    }

    await chain.run({});
    expect(execution.length).toBe(100);
    expect(execution.slice(0, 50)).toEqual(Array.from({ length: 50 }, (_, i) => i));
    expect(execution.slice(50)).toEqual(Array.from({ length: 50 }, (_, i) => 100 + (49 - i)));
  });
});
]==],
  },
{
    name = "Curry and Pipe",
    difficulty = "medium",
    stub = [=[
/**
 * Curry and Pipe
 *
 * Implement functional programming utilities for function composition
 * and partial application.
 *
 * Curry: Transform a function with multiple arguments into a sequence
 * of functions that each take a single argument.
 * - curry(fn): Returns a curried version that can be called incrementally
 * - Supports partial application: curry(fn)(a)(b)(c) or curry(fn)(a, b)(c)
 *
 * Pipe: Compose functions left-to-right where output of one becomes input of next.
 * - pipe(f, g, h)(x) === h(g(f(x)))
 * - Supports any number of functions
 * - Type-safe composition
 *
 * Implement:
 * - curry<T extends (...args: any[]) => any>(fn: T): Curried<T>
 *   Return a curried function that accepts arguments incrementally.
 *   When all arguments are provided, execute the original function.
 *
 * - pipe<A, B>(f: (a: A) => B): (a: A) => B
 *   pipe<A, B, C>(f: (a: A) => B, g: (b: B) => C): (a: A) => C
 *   pipe<A, B, C, D>(f: (a: A) => B, g: (b: B) => C, h: (c: C) => D): (a: A) => D
 *   Compose functions left-to-right.
 *
 * - compose<A, B>(g: (b: B) => A, f: (a: A) => B): (a: A) => A
 *   Compose functions right-to-left (mathematical composition order).
 *
 * Bonus: Implement curryN for explicit arity control and pipeAsync for async functions.
 */

export function curry<T extends (...args: any[]) => any>(fn: T): any {
  // YOUR CODE HERE
  return fn;
}

export function pipe<A, B>(f: (a: A) => B): (a: A) => B;
export function pipe<A, B, C>(f: (a: A) => B, g: (b: B) => C): (a: A) => C;
export function pipe<A, B, C, D>(f: (a: A) => B, g: (b: B) => C, h: (c: C) => D): (a: A) => D;
export function pipe(...fns: Function[]): Function {
  // YOUR CODE HERE
  return (x: any) => x;
}

export function compose<A, B>(g: (b: B) => A, f: (a: A) => B): (a: A) => A {
  // YOUR CODE HERE
  return (x: A) => x;
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { curry, pipe, compose } from './challenge';

describe('curry', () => {
  it('curries a function with 2 arguments', () => {
    const add = (a: number, b: number) => a + b;
    const curriedAdd = curry(add);
    expect(curriedAdd(2)(3)).toBe(5);
  });

  it('curries a function with 3 arguments', () => {
    const add3 = (a: number, b: number, c: number) => a + b + c;
    const curried = curry(add3);
    expect(curried(1)(2)(3)).toBe(6);
  });

  it('supports partial application', () => {
    const add = (a: number, b: number) => a + b;
    const curriedAdd = curry(add);
    const add5 = curriedAdd(5);
    expect(add5(3)).toBe(8);
    expect(add5(10)).toBe(15);
  });

  it('supports partial application with multiple args at once', () => {
    const add3 = (a: number, b: number, c: number) => a + b + c;
    const curried = curry(add3);
    expect(curried(1, 2)(3)).toBe(6);
    expect(curried(1)(2, 3)).toBe(6);
    expect(curried(1, 2, 3)).toBe(6);
  });

  it('works with string concatenation', () => {
    const concat = (a: string, b: string, c: string) => a + b + c;
    const curried = curry(concat);
    expect(curried('Hello')(' ')('World')).toBe('Hello World');
  });

  it('curries a function with 4 arguments', () => {
    const fn = (a: number, b: number, c: number, d: number) => a * b + c - d;
    const curried = curry(fn);
    expect(curried(2)(3)(4)(5)).toBe(5); // 2*3+4-5=5
  });

  it('returns same result as original function', () => {
    const multiply = (a: number, b: number, c: number) => a * b * c;
    const curried = curry(multiply);
    expect(curried(2)(3)(4)).toBe(multiply(2, 3, 4));
  });

  it('curried function can be reused', () => {
    const add = (a: number, b: number) => a + b;
    const curriedAdd = curry(add);
    const add10 = curriedAdd(10);
    expect(add10(5)).toBe(15);
    expect(add10(20)).toBe(30);
  });

  it('handles functions with different argument patterns', () => {
    const fn = (a: string, b: number) => a.repeat(b);
    const curried = curry(fn);
    expect(curried('x')(3)).toBe('xxx');
  });

  it('curry with 5 arguments', () => {
    const fn = (a: number, b: number, c: number, d: number, e: number) => 
      a + b + c + d + e;
    const curried = curry(fn);
    expect(curried(1)(2)(3)(4)(5)).toBe(15);
  });
});

describe('pipe', () => {
  it('pipes a single function', () => {
    const double = (x: number) => x * 2;
    const fn = pipe(double);
    expect(fn(5)).toBe(10);
  });

  it('pipes two functions', () => {
    const double = (x: number) => x * 2;
    const addOne = (x: number) => x + 1;
    const fn = pipe(double, addOne);
    expect(fn(5)).toBe(11); // (5*2)+1=11
  });

  it('pipes three functions', () => {
    const double = (x: number) => x * 2;
    const addOne = (x: number) => x + 1;
    const square = (x: number) => x * x;
    const fn = pipe(double, addOne, square);
    expect(fn(5)).toBe(121); // ((5*2)+1)^2=121
  });

  it('pipes with string transformations', () => {
    const toUpper = (s: string) => s.toUpperCase();
    const addExclaim = (s: string) => s + '!';
    const fn = pipe(toUpper, addExclaim);
    expect(fn('hello')).toBe('HELLO!');
  });

  it('pipes four functions', () => {
    const add = (x: number) => x + 1;
    const double = (x: number) => x * 2;
    const subtract = (x: number) => x - 3;
    const square = (x: number) => x * x;
    const fn = pipe(add, double, subtract, square);
    expect(fn(5)).toBe(81); // (((5+1)*2)-3)^2=81
  });

  it('pipe identity with no functions', () => {
    const fn = pipe();
    expect(fn(42)).toBe(42);
    expect(fn('test')).toBe('test');
  });

  it('pipe preserves types through chain', () => {
    const parse = (s: string) => parseInt(s, 10);
    const double = (n: number) => n * 2;
    const toString = (n: number) => n.toString();
    const fn = pipe(parse, double, toString);
    expect(fn('21')).toBe('42');
  });

  it('pipe with object transformations', () => {
    const addName = (obj: { age: number }) => ({ ...obj, name: 'Alice' });
    const addAge = (obj: {}) => ({ ...obj, age: 30 });
    const fn = pipe(addAge, addName);
    expect(fn({})).toEqual({ name: 'Alice', age: 30 });
  });
});

describe('compose', () => {
  it('composes two functions (right-to-left)', () => {
    const double = (x: number) => x * 2;
    const addOne = (x: number) => x + 1;
    const fn = compose(addOne, double);
    expect(fn(5)).toBe(11); // addOne(double(5))=addOne(10)=11
  });

  it('compose is pipe in reverse order', () => {
    const f = (x: number) => x + 1;
    const g = (x: number) => x * 2;
    const h = (x: number) => x - 3;
    const piped = pipe(f, g, h);
    const composed = compose(h, compose(g, f));
    expect(piped(5)).toBe(9); // ((5+1)*2)-3=9
    expect(composed(5)).toBe(9);
  });

  it('compose with string functions', () => {
    const toUpper = (s: string) => s.toUpperCase();
    const reverse = (s: string) => s.split('').reverse().join('');
    const fn = compose(reverse, toUpper);
    expect(fn('hello')).toBe('OLLEH'); // reverse(toUpper('hello'))
  });
});

describe('combined curry and pipe', () => {
  it('curried functions in pipe', () => {
    const add = (a: number, b: number) => a + b;
    const multiply = (a: number, b: number) => a * b;
    const curriedAdd = curry(add);
    const curriedMultiply = curry(multiply);
    const add5 = curriedAdd(5);
    const multiplyBy2 = curriedMultiply(2);
    const fn = pipe(add5, multiplyBy2);
    expect(fn(3)).toBe(16); // (3+5)*2=16
  });

  it('complex pipeline with curried functions', () => {
    const add = (a: number, b: number) => a + b;
    const multiply = (a: number, b: number) => a * b;
    const subtract = (a: number, b: number) => a - b;
    
    const curriedAdd = curry(add);
    const curriedMultiply = curry(multiply);
    const curriedSubtract = curry(subtract);
    
    const fn = pipe(
      curriedAdd(10),
      curriedMultiply(2),
      curriedSubtract(5)
    );
    expect(fn(5)).toBe(25); // ((5+10)*2)-5=25
  });
});

describe('edge cases', () => {
  it('curry with zero arguments function', () => {
    const fn = () => 42;
    const curried = curry(fn);
    expect(curried()).toBe(42);
  });

  it('pipe with identity-like functions', () => {
    const id = (x: number) => x;
    const fn = pipe(id, id, id);
    expect(fn(42)).toBe(42);
  });

  it('curry preserves function name', () => {
    function namedFn(a: number, b: number) { return a + b; }
    const curried = curry(namedFn);
    // The curried function should still work correctly
    expect(curried(1)(2)).toBe(3);
  });

  it('pipe handles null/undefined in chain', () => {
    const toNull = () => null;
    const fn = pipe(toNull);
    expect(fn()).toBeNull();
  });
});
]=],
  },
  {
    name = "Sliding Window Maximum",
    difficulty = "medium",
    stub = [=[
/**
 * Sliding Window Maximum
 *
 * Implement an efficient sliding window maximum algorithm.
 *
 * Given an array of integers and a window size k, return an array containing
 * the maximum value in each sliding window of size k as it moves from left
 * to right across the array.
 *
 * Example:
 *   nums = [1, 3, -1, -3, 5, 3, 6, 7], k = 3
 *   windows: [1, 3, -1], [3, -1, -3], [-1, -3, 5], [-3, 5, 3], [5, 3, 6], [3, 6, 7]
 *   maxes:   [3],         [3],         [5],         [5],         [6],         [7]
 *   result: [3, 3, 5, 5, 6, 7]
 *
 * Implement:
 * - maxSlidingWindow(nums: number[], k: number): number[]
 *   Return array of maximums for each window position.
 *
 * - maxSlidingWindowOptimized(nums: number[], k: number): number[]
 *   Use a monotonic deque for O(n) time complexity instead of O(n*k).
 *   The deque stores indices, maintaining decreasing order of values.
 *
 * - minSlidingWindow(nums: number[], k: number): number[]
 *   Same problem but find minimums instead of maximums.
 *
 * Constraints:
 * - 1 <= k <= nums.length
 * - nums can contain negative numbers
 * - Empty array returns empty array
 *
 * The optimized solution should use a deque (double-ended queue) where:
 * - Remove indices outside the current window from the front
 * - Remove indices of elements smaller than current from the back
 * - The front always has the index of the maximum element
 */

export function maxSlidingWindow(nums: number[], k: number): number[] {
  // YOUR CODE HERE
  return [];
}

export function maxSlidingWindowOptimized(nums: number[], k: number): number[] {
  // YOUR CODE HERE
  return [];
}

export function minSlidingWindow(nums: number[], k: number): number[] {
  // YOUR CODE HERE
  return [];
}
]=],
    tests = [=[
import { describe, it, expect } from 'vitest';
import { maxSlidingWindow, maxSlidingWindowOptimized, minSlidingWindow } from './challenge';

describe('maxSlidingWindow', () => {
  it('basic example', () => {
    const nums = [1, 3, -1, -3, 5, 3, 6, 7];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([3, 3, 5, 5, 6, 7]);
  });

  it('window size equals array length', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 5;
    expect(maxSlidingWindow(nums, k)).toEqual([5]);
  });

  it('window size of 1', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 1;
    expect(maxSlidingWindow(nums, k)).toEqual([1, 2, 3, 4, 5]);
  });

  it('all same values', () => {
    const nums = [5, 5, 5, 5, 5];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([5, 5, 5]);
  });

  it('decreasing array', () => {
    const nums = [5, 4, 3, 2, 1];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([5, 4, 3]);
  });

  it('increasing array', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 3;
    expect(maxSlidingWindow(nums, k)).toEqual([3, 4, 5]);
  });

  it('with negative numbers', () => {
    const nums = [-1, -2, -3, -4, -5];
    const k = 2;
    expect(maxSlidingWindow(nums, k)).toEqual([-1, -2, -3, -4]);
  });

  it('mixed positive and negative', () => {
    const nums = [10, -5, 3, -2, 8, -1, 6];
    const k = 4;
    expect(maxSlidingWindow(nums, k)).toEqual([10, 8, 8]);
  });

  it('single element array', () => {
    const nums = [42];
    const k = 1;
    expect(maxSlidingWindow(nums, k)).toEqual([42]);
  });

  it('empty array', () => {
    expect(maxSlidingWindow([], 1)).toEqual([]);
  });

  it('two elements', () => {
    const nums = [1, 2];
    expect(maxSlidingWindow(nums, 1)).toEqual([1, 2]);
    expect(maxSlidingWindow(nums, 2)).toEqual([2]);
  });

  it('large window at end', () => {
    const nums = [1, 2, 3, 100, 50];
    const k = 4;
    expect(maxSlidingWindow(nums, k)).toEqual([100, 100]);
  });
});

describe('maxSlidingWindowOptimized', () => {
  it('basic example', () => {
    const nums = [1, 3, -1, -3, 5, 3, 6, 7];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([3, 3, 5, 5, 6, 7]);
  });

  it('window size equals array length', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 5;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([5]);
  });

  it('window size of 1', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 1;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([1, 2, 3, 4, 5]);
  });

  it('all same values', () => {
    const nums = [5, 5, 5, 5, 5];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([5, 5, 5]);
  });

  it('decreasing array', () => {
    const nums = [5, 4, 3, 2, 1];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([5, 4, 3]);
  });

  it('increasing array', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 3;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([3, 4, 5]);
  });

  it('with negative numbers', () => {
    const nums = [-1, -2, -3, -4, -5];
    const k = 2;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([-1, -2, -3, -4]);
  });

  it('mixed positive and negative', () => {
    const nums = [10, -5, 3, -2, 8, -1, 6];
    const k = 4;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([10, 8, 8]);
  });

  it('single element array', () => {
    const nums = [42];
    const k = 1;
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([42]);
  });

  it('empty array', () => {
    expect(maxSlidingWindowOptimized([], 1)).toEqual([]);
  });

  it('matches naive implementation', () => {
    const testCases = [
      [[1, 3, -1, -3, 5, 3, 6, 7], 3],
      [[1, 2, 3, 4, 5], 2],
      [[5, 4, 3, 2, 1], 4],
      [[-10, -20, -30, -40], 2],
      [[100, 1, 2, 3, 4, 5, 6, 7, 8], 5],
    ];
    
    for (const [nums, k] of testCases) {
      expect(maxSlidingWindowOptimized(nums as number[], k as number))
        .toEqual(maxSlidingWindow(nums as number[], k as number));
    }
  });

  it('stress test with large array', () => {
    const nums = Array.from({ length: 1000 }, (_, i) => i % 100);
    const k = 50;
    const result = maxSlidingWindowOptimized(nums, k);
    expect(result.length).toBe(1000 - k + 1);
    // Each window max should be 99 (since we cycle 0-99)
    for (const max of result) {
      expect(max).toBeLessThanOrEqual(99);
      expect(max).toBeGreaterThanOrEqual(0);
    }
  });
});

describe('minSlidingWindow', () => {
  it('basic example', () => {
    const nums = [1, 3, -1, -3, 5, 3, 6, 7];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([-1, -3, -3, -3, 3, 3]);
  });

  it('window size equals array length', () => {
    const nums = [5, 2, 8, 1, 9];
    const k = 5;
    expect(minSlidingWindow(nums, k)).toEqual([1]);
  });

  it('window size of 1', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 1;
    expect(minSlidingWindow(nums, k)).toEqual([1, 2, 3, 4, 5]);
  });

  it('all same values', () => {
    const nums = [5, 5, 5, 5, 5];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([5, 5, 5]);
  });

  it('decreasing array', () => {
    const nums = [5, 4, 3, 2, 1];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([3, 2, 1]);
  });

  it('increasing array', () => {
    const nums = [1, 2, 3, 4, 5];
    const k = 3;
    expect(minSlidingWindow(nums, k)).toEqual([1, 2, 3]);
  });

  it('with negative numbers', () => {
    const nums = [-1, -2, -3, -4, -5];
    const k = 2;
    expect(minSlidingWindow(nums, k)).toEqual([-2, -3, -4, -5]);
  });

  it('single element array', () => {
    const nums = [42];
    const k = 1;
    expect(minSlidingWindow(nums, k)).toEqual([42]);
  });

  it('empty array', () => {
    expect(minSlidingWindow([], 1)).toEqual([]);
  });

  it('stress test', () => {
    const nums = Array.from({ length: 500 }, (_, i) => 500 - i);
    const k = 100;
    const result = minSlidingWindow(nums, k);
    expect(result.length).toBe(500 - k + 1);
    // First window min should be 401 (500-99)
    expect(result[0]).toBe(401);
    // Last window min should be 1
    expect(result[result.length - 1]).toBe(1);
  });
});

describe('edge cases', () => {
  it('k equals 1 for all functions', () => {
    const nums = [5, 2, 8, 1, 9];
    expect(maxSlidingWindow(nums, 1)).toEqual(nums);
    expect(maxSlidingWindowOptimized(nums, 1)).toEqual(nums);
    expect(minSlidingWindow(nums, 1)).toEqual(nums);
  });

  it('k equals array length', () => {
    const nums = [3, 1, 4, 1, 5, 9, 2, 6];
    const k = nums.length;
    expect(maxSlidingWindow(nums, k)).toEqual([Math.max(...nums)]);
    expect(maxSlidingWindowOptimized(nums, k)).toEqual([Math.max(...nums)]);
    expect(minSlidingWindow(nums, k)).toEqual([Math.min(...nums)]);
  });

  it('very large numbers', () => {
    const nums = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 0];
    const k = 2;
    expect(maxSlidingWindow(nums, k)).toEqual([Number.MAX_SAFE_INTEGER, 0]);
    expect(minSlidingWindow(nums, k)).toEqual([Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER]);
  });

  it('floating point numbers', () => {
    const nums = [1.5, 3.7, -2.1, 0.5];
    const k = 2;
    expect(maxSlidingWindow(nums, k)).toEqual([3.7, 3.7, 0.5]);
    expect(minSlidingWindow(nums, k)).toEqual([1.5, -2.1, -2.1]);
  });
});
]=],
  },
}

--- Deterministic challenge selection based on date.
--- Cycles sequentially through challenges using day-of-year.
function M.get_challenge_for_date(date_str)
  local y, m, d = date_str:match('(%d+)-(%d+)-(%d+)')
  if y and m and d then
    local t = os.time({ year = tonumber(y), month = tonumber(m), day = tonumber(d) })
    local jan1 = os.time({ year = tonumber(y), month = 1, day = 1 })
    local day_of_year = math.floor((t - jan1) / 86400)
    local idx = (day_of_year % #M.challenges) + 1
    return M.challenges[idx]
  end

  local seed = 0
  for i = 1, #date_str do
    seed = seed * 31 + string.byte(date_str, i)
  end
  local idx = (seed % #M.challenges) + 1
  return M.challenges[idx]
end

return M
