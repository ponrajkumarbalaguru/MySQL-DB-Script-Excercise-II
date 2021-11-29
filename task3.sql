CREATE DATABASE Task3;
USE Task3;
CREATE TABLE countries(
Country_id INT NOT NULL PRIMARY KEY,
country_name ENUM('Italy','India','China'),
region_id INT NOT NULL
);
CREATE TABLE job_histry(
Employee_id INT NOT NULL PRIMARY KEY,
start_date DATE NOT NULL,
end_date DATE NOT NULL CHECK (end_date LIKE '--/--/----'),
job_id INT NOT NULL,
department_id INT NOT NULL
);
ALTER TABLE `countries` CHANGE COLUMN `Country_id` `Country_id` INT NOT NULL AUTO_INCREMENT FIRST;
ALTER TABLE job_histry ADD FOREIGN KEY (job_id) REFERENCES task2.job(job_id);
UPDATE task2.employee SET Email='not available' WHERE Employee_id;
UPDATE task2.employee SET Salary = 8000 WHERE Employee_id=105 AND Salary < 5000;
UPDATE task2.employee SET Job_id= 'SH_CLERK' WHERE Employee_id=118 AND Department_id=30 AND NOT Job_id LIKE 'SH%';
UPDATE task2.employee SET Salary= CASE Department_id 
 WHEN 40 THEN Salary+(Salary*.25) 
 WHEN 90 THEN Salary+(Salary*.15)
 WHEN 110 THEN Salary+(Salary*.10)
  ELSE Salary
    END
 WHERE Department_id IN (40,50,60,70,80,90,110);
SELECT COUNT(DISTINCT job_id) FROM task2.employee;
SELECT SUM(Salary) FROM task2.employee;
SELECT MIN(Salary) FROM task2.employee;