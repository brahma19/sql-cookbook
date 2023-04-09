/* Data
employee_id  employee_name  manager_path
-----------------------------------------
1            Alice          NULL
2            Bob            1
3            Charlie        2,1
4            David          3,2,1
*/

WITH RECURSIVE employee_hierarchy AS (
  SELECT 
    employee_id, 
    employee_name,
    SPLIT(manager_path, ',') AS manager_ids
  FROM 
    employees 
), 
flattened_employee_hierarchy AS (
  SELECT 
    employee_id, 
    employee_name,
    manager_id
  FROM 
    employee_hierarchy, 
    UNNEST(manager_ids) AS manager_id
)
SELECT 
  e.employee_id,
  e.employee_name,
  m.employee_id AS manager_id,
  m.employee_name AS manager_name
FROM 
  employee_hierarchy AS e
  LEFT JOIN (
SELECT 
  employee_id, 
  employee_name,
  CAST(manager_ids[OFFSET(ARRAY_LENGTH(manager_ids)-1)] AS INT64) AS manager_id
FROM 
  employee_hierarchy
WHERE 
  CAST(manager_ids[OFFSET(ARRAY_LENGTH(manager_ids)-1)] AS INT64) IS NOT NULL
  ) AS m ON m.manager_id = e.employee_id
