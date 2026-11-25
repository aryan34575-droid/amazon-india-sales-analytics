# Deployment Guide — GitHub Pages

The dashboard is a static HTML page and does not require a server-side runtime or build command.

## 1. Enable GitHub Pages

1. Open the repository on GitHub.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, choose **GitHub Actions** as the source.
4. Confirm that the workflow file exists at `.github/workflows/pages.yml`.
5. Push a commit to the `main` branch, or run the workflow manually from **Actions**.
6. Open the Pages workflow run and wait for the deployment job to complete.
7. Find the published URL in **Settings → Pages** or in the successful workflow summary.

## 2. What the workflow does

The workflow checks out the repository, configures Pages, uploads the repository root as the static site artifact, and deploys it to GitHub Pages. The dashboard entry point is `index.html` at the repository root.

## 3. Update the dashboard

When the dashboard or public-safe data changes:
1. Replace `index.html` with the updated, tested dashboard.
2. Keep the embedded data aligned with the version of the cleaned public-safe CSV in `data/processed/`.
3. Commit and push the change to `main`.
4. Wait for the Pages workflow to finish.

## 4. Troubleshooting

- **404 / site not found:** Check that Pages is enabled with GitHub Actions and that the deployment workflow succeeded.
- **Old version appears:** Wait for deployment completion, then hard-refresh the browser.
- **Charts fail to render:** Check browser console errors and confirm that the deployed `index.html` is the validated dashboard build.
- **Large repository warning:** The embedded dataset makes the HTML file relatively large. Avoid committing multiple duplicate dashboard exports.

## 5. Vercel alternative

The same repository can be imported into Vercel as a static site:
- Framework preset: Other
- Root directory: `./`
- Build command: leave empty
- Output directory: leave default or set to `./`

Deploy only after the intended HTML dashboard is committed to the repository.
