# Latex Template
## Install dependencies
```bash
# Font
curl https://www.tug.org/fonts/getnonfreefonts/install-getnonfreefonts > /tmp/install-getnonfreefonts
sudo texlua /tmp/install-getnonfreefonts
sudo getnonfreefonts --sys -a

# Packages
sudo tlmgr install latexmk ucs sectsty apacite titling blindtext todonotes texcount
```

## Make PDF
```bash
# Create all
make all

# Preview and watch for changes
make watch
```
