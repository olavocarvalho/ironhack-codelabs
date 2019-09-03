use publications;

DROP TABLE IF EXISTS publications.titleroyalty
CREATE TEMPORARY TABLE publications.titleroyalty
SELECT 
	titles.title_id,
	titleauthor.au_id,
	titleauthor.royaltyper,
	titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as `ROYALTY`,
	titles.advance * titleauthor.royaltyper / 100
FROM sales
	INNER JOIN
	titles
		ON titles.title_id = sales.title_id
	INNER JOIN
	titleauthor
		ON titleauthor.title_id = sales.title_id;

DROP TABLE IF EXISTS publications.aggregated
CREATE TEMPORARY TABLE publications.aggregated
SELECT titleauthor.au_id as `AUTHOR ID`, 
	   titleroyalty.title_id as `TITLE ID`, 
	   SUM(titleroyalty.ROYALTY * titleauthor.royaltyper) / 100 as `SUM_SALES_ROYALTY`,
	   MAX(titleauthor.royaltyper) AS `ROYALTYPER`
  FROM titleroyalty
	   INNER JOIN 
	   titleauthor 
	ON titleauthor.title_id = titleroyalty.title_id
	   INNER JOIN 
	   authors 
	ON authors.au_id = titleauthor.au_id
GROUP BY 1, 2;
SELECT * FROM publications.aggregated;
