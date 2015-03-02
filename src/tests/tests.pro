TEMPLATE = app

QT += testlib network xml

CONFIG += testcase

INCLUDEPATH += ../lib
LIBS += -L../lib -ltwomusic

SOURCES += testowncloudclient.cpp

HEADERS += \
    config.h
