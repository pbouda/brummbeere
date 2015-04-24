TEMPLATE = subdirs

SUBDIRS = lib \
          #tests \
          mainapp

mainapp.depends = lib
#tests.depnds = lib
