--SQL Project - Library Management System N2

SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM members;
SELECT * FROM return_status;

--Task.13 Identify Members with Overdue Books
--Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.

-- issued_status == memeber == books == return_status
-- filter books which is return
-- overdue > 30
SELECT CURRENT_DATE
SELECT 
    ist.issued_member_id,
	m.member_name,
	bk.book_title,
	ist.issued_date,
	--rs.return_date,
	CURRENT_DATE - ist.issued_date as over_dues_days
FROM issued_status as ist
JOIN 
members as m 
ON m.member_id = ist.issued_member_id
JOIN
books as bk
ON bk.isbn = ist.issued_book_isbn
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE
rs.return_date IS NULL
AND (CURRENT_DATE - ist.issued_date) > 30
ORDER BY 1


