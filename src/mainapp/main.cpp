#include <QApplication>
#include <QQmlApplicationEngine>
#include "qwebdav.h"

int main(int argc, char *argv[])
{
    QWebDAV *dav = new QWebDAV();
    dav->initialize("URL", "user", "pass");
    dav->list("/");

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
