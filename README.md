download-make-install Cookbook
===============================

This cookbook run download target source, extract, configure, make, make install process.

Requirements
------------

#### cookbook
- `build-essential` - building some target source needs gcc/g++ and related headers.

Attributes
----------

#### download-make-install::default

`node['makeinstallcookbook']['install_prefix']` - install path prefix: default is '/usr/local'
`node['makeinstallcookbook']['packages']` - build target source definitions hash-array. hash include few keys. `url` is target source file location, required. `configure_options` value will pass-through to ./configure option, optional. `target` is expected installed file/directory after installation, optional. if `target` is omitted then try to download/install everytime.

Usage
-----
#### download-make-install::default

Include `makeinstallcookbook` in your node's `run_list` and set packages information:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[makeinstallcookbook]"
  ],
  "override_attributes" : {
    "makeinstallcookbook": {
      "install_prefix" : "/usr/local/",
      "packages": [
        {
          "url": "http://mecab.googlecode.com/files/mecab-0.994.tar.gz",
          "configure_options": "--with-charset=utf8 --enable-utf8-only",
          "target": "/usr/local/lib/libmecab.so"
        },
        {
          "url": "http://mecab.googlecode.com/files/mecab-ipadic-2.7.0-20070801.tar.gz",
          "configure_options": "--with-charset=utf8",
          "target": "/usr/local/lib/mecab"
        },
        {
          "url": "http://www.sqlite.org/2013/sqlite-autoconf-3080200.tar.gz",
          "target": "/usr/local/bin/sqlite3"
        }
      ]
    }
  }
}
```

License and Authors
-------------------
Authors: Arun Chaitanya Jami
License: Apache 2.0
