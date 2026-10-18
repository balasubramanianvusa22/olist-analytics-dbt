# olist-analytics-dbt

An analytics engineering portfolio project: a dbt project on the
[Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce),
running on DuckDB so it builds locally with no warehouse account.

**Status:** early. The orders source and staging model are built. More tables and a
finance mart (order-to-payment reconciliation) are planned.

## Run it locally

Requires Python 3.12.

1. Clone the repo and create a virtual environment:
   ```powershell
   python -m venv .venv
   .\.venv\Scripts\Activate.ps1
   python -m pip install -r requirements.txt
   ```
2. Download the dataset from Kaggle (link above) and unzip the CSVs into `data/raw/`.
3. Build:
   ```powershell
   dbt debug
   dbt run
   ```

`profiles.yml` is committed on purpose: DuckDB needs no credentials, and dbt builds a local
`olist.duckdb` file.

## Data and license

Data by Olist, published on Kaggle under
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).
The raw CSVs are not included in this repo.
