TEMPLATE = app

QT += qml quick widgets xml

TARGET = twomusic

SOURCES += main.cpp

#DEPENDPATH += ../lib
INCLUDEPATH += ../lib
#LIBS += ../lib/debug/twomusic-lib.dll
LIBS += -L../lib -ltwomusic
#PRE_TARGETDEPS += ../lib/libtwomusic-lib.dylib

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
