TEMPLATE = app

QT += quick xml

TARGET = brummbeere

SOURCES += main.cpp

INCLUDEPATH += ../lib
win32 {
    LIBS += -L../lib/debug -lbrummbeere
} else {
    LIBS += -L../lib -lbrummbeere
}

RESOURCES += qml.rc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
