TEMPLATE = app

QT += qml quick widgets xml

SOURCES += main.cpp \
    owncloudclient.cpp \
    qwebdav.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    owncloudclient.h \
    qwebdav.h
