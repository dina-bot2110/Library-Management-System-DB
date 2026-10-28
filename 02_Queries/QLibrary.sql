use Library;
SELECT 
    b.title,
    COUNT(l.loan_id) AS total_loans
FROM loans l
JOIN copies c ON l.copy_id = c.copy_id
JOIN books b ON c.book_id = b.book_id
GROUP BY b.title
HAVING COUNT(l.loan_id) > 30
ORDER BY total_loans DESC;

SELECT 
    cat.category_name,
    COUNT(l.loan_id) AS total_loans
FROM loans l
JOIN copies c ON l.copy_id = c.copy_id
JOIN books b ON c.book_id = b.book_id
JOIN categories cat ON b.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY total_loans DESC;

SELECT 
    COUNT(CASE WHEN return_date > due_date THEN 1 END) AS late_returns,
    COUNT(loan_id) AS total_completed_loans,
    ROUND(
        (COUNT(CASE WHEN return_date > due_date THEN 1 END) * 100.0) / COUNT(loan_id), 
    2) AS late_return_percentage
FROM loans
WHERE return_date IS NOT NULL;

SELECT 
    CONCAT(u.first_name, ' ', u.last_name) AS member_name,
    COUNT(l.loan_id) AS total_loans
FROM loans l
JOIN users u ON l.user_id = u.user_id
GROUP BY u.user_id, u.first_name, u.last_name
HAVING COUNT(l.loan_id) >= 40
ORDER BY total_loans DESC;

SELECT 
    DATE_FORMAT(borrow_date, '%Y-%m') AS loan_month,
    COUNT(loan_id) AS total_loans
FROM loans
GROUP BY loan_month
ORDER BY loan_month ASC;

SELECT 
    b.title,
    COUNT(DISTINCT r.reservation_id) AS total_reservations,
    COUNT(DISTINCT c.copy_id) AS total_copies,
    CASE 
        WHEN COUNT(DISTINCT r.reservation_id) > COUNT(DISTINCT c.copy_id) THEN 'High Demand'
        ELSE 'Normal'
    END AS demand_status
FROM books b
LEFT JOIN reservations r ON b.book_id = r.book_id
LEFT JOIN copies c ON b.book_id = c.book_id
GROUP BY b.book_id, b.title
ORDER BY total_reservations DESC;