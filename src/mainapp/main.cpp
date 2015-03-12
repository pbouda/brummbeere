#include <QGuiApplication>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>

#include "filemodel.h"
#include "qwebdav.h"

QString DAV_URL("http://127.0.0.1/owncloud");
QString DAV_USER("user");
QString DAV_PASS("password");

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    FileModel model;
    model.initDav(DAV_URL, DAV_USER, DAV_PASS);
    model.loadFromDir("/");

    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setWidth(480);
    view.setHeight(640);

    QQmlContext *ctxt = view.rootContext();
    ctxt->setContextProperty("currentFolderModel", &model);
    view.setSource(QUrl("qrc:view.qml"));

    QObject *item = view.rootObject();
    QObject::connect(item, SIGNAL(itemSelected(int)),
                         &model, SLOT(loadFolder(int)));

    view.show();
    return app.exec();
}
