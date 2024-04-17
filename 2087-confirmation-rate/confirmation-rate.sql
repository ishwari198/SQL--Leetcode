SELECT 
    s.user_id,
    CASE 
        WHEN COUNT(s.user_id) = 0 THEN 0 
        ELSE ROUND(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / COUNT(s.user_id),2) 
    END AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c ON s.user_id = c.user_id
GROUP BY 
    s.user_id;