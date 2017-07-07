The purpose of this repo is to track code and docs needed for fixing  the HTML->CNXML back transforms  that have led to not-valid CNXML from use of the beta editor.

Existing CNXML files can be tested for validity using the `jing` comandline validator, and the relaxNG schema that are part of the [cnxml](https://github.com/Connexions/cnxml) package/repo. There is a specific one customized for use with `jing`, named `cnxml-jing.rng`. It is used as so:

$ `jing /path/to/cnxml-jing.rng index.cnxml`

Alternatively, you can use the same rng file with the atom atom editor and the `linter` package to get realtime display of validity errors.  

The file `fix_beta_cnxml.xsl` is for use with `xsltproc` to fix many of the existing errors (adding required `id` attributes that are missing, etc.) This is used as so:

$ `xsltproc fix_beta_cnxml.xsl index.cnxml index_fixed.cnxml`
