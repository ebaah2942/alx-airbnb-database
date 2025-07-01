Brief Report on Performance Improvements
Partitioning Report
Goal: Improve query performance on a large bookings table by partitioning it by year (check_in_date).

Process:

The original bookings table was renamed.

A new partitioned parent table was created.

Partitions were created for 2023, 2024, and 2025.

Data was migrated and tested.

Test Query:


SELECT * FROM bookings 
WHERE check_in_date BETWEEN '2024-07-01' AND '2024-07-31';
Results:

### 📊 Partitioning Performance Comparison

| Metric                   | Before Partitioning | After Partitioning     |
|--------------------------|---------------------|-------------------------|
| Execution Plan           | Full Table Scan     | Single Partition Scan   |
| Rows Scanned             | Entire table        | Only 1 partition        |
| Execution Time (example) | ~120ms              | ~25ms                   |

Conclusion:
Partitioning significantly reduced the number of rows scanned and improved the speed of queries filtered by check_in_date. This is especially effective for time-based queries on large datasets.