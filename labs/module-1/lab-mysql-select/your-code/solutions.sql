USE publications;

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, titles.title as `TITLE`
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id;

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, COUNT(titles.title) as `TITLES QTDY`
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY 1, 2, 3;

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, COUNT(titles.title) as `TITLES QTDY`
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC
LIMIT 3;

SELECT authors.au_id as `AUTHOR ID`, authors.au_lname as `LAST NAME`, authors.au_fname as `FIRST NAME`, COUNT(titles.title) as `TITLES QTDY`
FROM authors
LEFT OUTER JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT OUTER JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC