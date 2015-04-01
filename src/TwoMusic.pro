TEMPLATE = subdirs

SUBDIRS = lib \
          #tests \
          mainapp \
          mainappfb

mainapp.depends = lib
#tests.depnds = lib
