Goal: Measure IPC performance by sending 1 byte back-and-forth between two processes using two pipes.

Method: Parent and child communicate using:

pipe1: parent → child

pipe2: child → parent
Each loop iteration is one exchange (round-trip).

Timing: Use uptime() before and after n exchanges.

Metric:
exchanges/sec = n \* 100 / ticks_elapsed (assuming ~100 ticks/sec in xv6)

Result: Paste your run output(s) and briefly comment (e.g., “increasing n stabilizes the measurement”, “context switches + pipe overhead dominate”).
