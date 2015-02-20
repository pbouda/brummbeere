TEMPLATE = app

QT += testlib

CONFIG += testcase

INCLUDEPATH += ../lib
LIBS += -L../lib/debug -ltwomusic

SOURCES += testowncloudclient.cpp

HEADERS += \
    config.h
