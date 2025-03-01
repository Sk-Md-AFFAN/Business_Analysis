
SELECT 
    Ticker,
    Date,
    [Open],
    [High],
    [Low],
    [Close],
    Adj_Close,
    Volume,
    
    ROUND(AVG([Close]) OVER (
        PARTITION BY Ticker 
        ORDER BY Date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_7_days,

    ROUND((([Close] - [Open]) / [Open]) * 100, 2) AS daily_price_change,

    ROUND(STDEV([Close]) OVER (
        PARTITION BY Ticker 
        ORDER BY Date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS volatility_7_days,

    ROUND(((MAX([Close]) OVER (PARTITION BY Ticker)) - MIN([Close]) OVER (PARTITION BY Ticker))
    / MIN([Close]) OVER (PARTITION BY Ticker) * 100, 2) AS stock_return

FROM stocks
ORDER BY Ticker, Date;



SELECT Ticker,AVG([Open]) AS opening_avg,AVG([Close]) AS closing_avg,SUM(CAST(Volume AS bigint)) AS total_trades
FROM stocks
GROUP BY Ticker