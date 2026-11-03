# olist-analytics-dbt

An analytics engineering portfolio project: a dbt project on the
[Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce),
running on DuckDB so it builds locally with no warehouse account.

**Status:** in progress. Sources and staging models are built for all eight Olist tables.
Work is committed in small steps, so the history shows how the project grows.

## Roadmap

- [x] Project setup on DuckDB, with sources defined over the raw CSVs
- [x] Staging models for every table (`stg_olist__*`): renamed columns, cast types, money as `decimal(10,2)`
- [ ] Tests and data quality on staging: keys, relationships, accepted values, freshness of order dates
- [ ] Intermediate models: order lines joined to products and sellers, payments rolled up per order
- [ ] Core marts: orders fact, customers and sellers dimensions
- [ ] Finance mart: order-to-payment reconciliation that flags orders whose payments don't match item and freight totals
- [ ] dbt docs and a lineage graph
- [ ] CI with GitHub Actions: `dbt build` on every pull request

## Layout

```
models/
  staging/olist/      one model per source table, light cleanup only
  intermediate/       (planned) joins and rollups
  marts/core/         (planned) facts and dimensions
  marts/finance/      (planned) reconciliation
```

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
