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
}

return M
