# Employee Data Pipeline using GCP

## Objective

Build an end-to-end pipeline to ingest employee CSV data into GCP, clean and transform it in BigQuery, and create a reporting table.

## Architecture
CSV -> Google Cloud Storage (GCS) -> BigQuery (Raw Table) -> SQL Transformations -> employee_summary

## Tech Stack
- Google Cloud Platform (GCP)
- Cloud Storage (GCS)
- BigQuery
- SQL

## Dataset
File Name: employees.csv
Columns:
- employee_id
- employee_name
- department
- salary
- city
- joining_date

## Cleaning Performed
- Removed duplicates
- handled missing salary and city
- Standardized employee names

## SQL Analysis
- Department counts
- average salary
- highest/lowest salary
- salary by department
- top earners

## Project Structure


employee-data-pipeline-gcp/
|
|-- data/
|   |-- employees.csv
|
|-- sql/
|   |-- employee_summary.sql
|
|-- screenshots/
|--README.md
|-- requirements.txt


## How to Run
1. Upload the `employees.csv` file to a Google Cloud Storage (GCS) bucket.
2. Open BigQuery and create a dataset named `employee_dataset`.
3. Create a table named `employee_data` by loading the `employees.csv` file from GCS.
4. Open the `sql/employee_summary.sql` file and execute the SQL query to create the `employee_summary` table.
5. Run the SQL analysis queries to analyze the employee data:
   - Department-wise employee count
   - Average salary
   - Highest salary
   - Lowest salary
   - Salary by department
   - Top earning employees
6. Verify the results in the `employee_summary` table and review the analysis query outputs.












