#include <QApplication>
#include <QQmlApplicationEngine>
#include "qwebdav.h"

int main(int argc, char *argv[])
{
    QWebDAV dav = QWebDAV();
    dav.initialize("https://owncloud.cidles.eu/remote.php/webdav", "pbouda", "Mister12d!");
    dav.list("/");

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
