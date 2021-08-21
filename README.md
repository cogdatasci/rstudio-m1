# rstudio-m1
Rstudio docker image for use on Apple M1 silicon. Based on [elbamos/rstudio-m1](https://github.com/elbamos/rstudio-m1) image.

Example usage:

```bash
docker run -d -p 8787:8787 -v "`pwd`":/home/rstudio/working \
 -e PASSWORD=p@ssw0rd12345 -e ROOT=TRUE
 cogdatasci/rstudio-m1
 ```
 
This image installs some important R packages and changes keybindings to use `Cmd+/` as uncomment consistent with most other IDEs
