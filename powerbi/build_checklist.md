# Power BI Validation Checklist

Before publishing a refreshed dashboard screenshot:

- [ ] Execute Bronze, Silver and Gold in Databricks.
- [ ] Run `docs/validation.sql`.
- [ ] Open `OlistAnalytics.pbip`.
- [ ] Configure the Databricks server and SQL Warehouse HTTP path locally.
- [ ] Authenticate and refresh the Gold model.
- [ ] Verify the four measures against the SQL validation query.
- [ ] Confirm Top 10 categories and city/state combinations.
- [ ] Verify report rendering and cross-filter interactions.
- [ ] Save PBIP/PBIX from Power BI Desktop.
- [ ] Capture a real dashboard screenshot if one will be displayed in the README.
- [ ] Confirm that no credentials or tokens are present before publication.
