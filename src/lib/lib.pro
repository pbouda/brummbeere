TEMPLATE = lib

QT += network xml

TARGET = twomusic

CONFIG += staticlib

SOURCES += \
    owncloudclient.cpp \
    qwebdav.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

HEADERS += \
    owncloudclient.h \
    qwebdav.h
