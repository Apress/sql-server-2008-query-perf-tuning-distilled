SELECT * INTO Trace_Table
FROM ::fn_trace_gettable('C:\PerfLogs\TuningDistilled.trc', default) 


SELECT COUNT(*) AS TotalExecutions, EventClass, TextData
  , SUM(Duration) AS Duration_Total
  , SUM(CPU) AS CPU_Total
  , SUM(Reads) AS Reads_Total
  , SUM(Writes) AS Writes_Total
FROM Trace_Table
GROUP BY EventClass, TextData
ORDER BY Reads_Total DESC


SELECT COUNT(*) AS TotalExecutions, EventClass
  , CAST(TextData AS NVARCHAR(MAX)) TextData
  , SUM(Duration) AS Duration_Total
  , SUM(CPU) AS CPU_Total
  , SUM(Reads) AS Reads_Total
  , SUM(Writes) AS Writes_Total
FROM Trace_Table
GROUP BY EventClass, CAST(TextData AS NVARCHAR(MAX))
ORDER BY Reads_Total DESC
