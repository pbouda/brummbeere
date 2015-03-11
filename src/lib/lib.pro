TEMPLATE = lib

QT += network xml

TARGET = twomusic

CONFIG += staticlib

SOURCES += \
    qwebdav.cpp \
    filemodel.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

HEADERS += \
    qwebdav.h \
    filemodel.h
