TEMPLATE = app

QT += quick xml

TARGET = twomusic

SOURCES += main.cpp

INCLUDEPATH += ../lib
win32 {
    LIBS += -L../lib/debug -ltwomusic
} else {
    LIBS += -L../lib -ltwomusic
}

RESOURCES += qml.rc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
