# uptime

Every ten minutes a GitHub Actions job fetches each URL in `sites.txt`. If any returns an error
or does not answer, it opens an issue labelled `outage` (which emails the repository owner) and
adds a comment on each later failing run; when everything answers again it closes the issue.

No external service, no account, no cost: public repositories get Actions minutes for free.
Edit `sites.txt` to change what is watched. `./check.sh` runs the same check locally.
