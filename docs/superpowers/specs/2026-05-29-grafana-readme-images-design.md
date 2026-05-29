# Design Spec: Grafana Configuration Guide with Images in README

## Goal
Add detailed step-by-step instructions with images to guide the user in setting up Grafana, configuring the Prometheus data source, and importing the Node Exporter dashboard (ID 1860).

## Proposed Changes

### `README.md`
- Replace the existing basic Grafana dashboard documentation section (`# 📈 Dashboard Grafana` at lines 592-607) with a comprehensive step-by-step guide.
- The guide will include screenshots stored in the `imgs/` directory:
  1. `imgs/login_01.png` - Grafana login screen.
  2. `imgs/login_02.png` - Reset password page.
  3. `imgs/data_source_01.png` - Connections & Data Sources menu.
  4. `imgs/data_source_02.png` - Select Prometheus option.
  5. `imgs/data_source_03.png` - Prometheus configuration and connection test.
  6. `imgs/dash_01.png` - Dashboards section entry.
  7. `imgs/dash_02.png` - Dashboard import button.
  8. `imgs/dash_03.png` - Inport field for Dashboard ID 1860.
  9. `imgs/dash_04.png` - Load dashboard configuration.
  10. `imgs/dash_05.png` - Select Prometheus data source and click Import.

## Verification Plan
- Visually verify that the image paths resolve correctly in the markdown file.
- Verify markdown rendering syntax.
