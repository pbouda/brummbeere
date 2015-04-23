TEMPLATE = subdirs

SUBDIRS = lib \
          #tests \
          #mainapp \
          mainappfb

mainappfb.depends = lib
#tests.depnds = lib
