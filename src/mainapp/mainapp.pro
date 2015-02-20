TEMPLATE = app

QT += qml quick widgets

TARGET = twomusic-app

SOURCES += main.cpp

#DEPENDPATH += ../lib
INCLUDEPATH += ../lib
LIBS += ../lib/libtwomusic-lib.dylib
#PRE_TARGETDEPS += ../lib/libtwomusic-lib.dylib

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
