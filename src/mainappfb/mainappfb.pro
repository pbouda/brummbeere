TEMPLATE = app

QT += widgets xml

TARGET = twomusic

SOURCES += main.cpp

INCLUDEPATH += ../lib
win32 {
    LIBS += -L../lib/debug -ltwomusic
} else {
    LIBS += -L../lib -ltwomusic
}

# Default rules for deployment.
include(deployment.pri)

