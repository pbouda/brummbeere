//#include <QGuiApplication>

#include "qtquickcontrolsapplication.h"
#include <QtQml/QQmlApplicationEngine>
#include <QtGui/QSurfaceFormat>
#include <QQmlContext>
#include <QQuickWindow>

/*#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>*/

#include "filemodel.h"

QString DAV_URL("https://localhost");
QString DAV_USER("test");
QString DAV_PASS("password");

int main(int argc, char *argv[])
{
    //QGuiApplication app(argc, argv);
    QtQuickControlsApplication app(argc, argv);
    if (QCoreApplication::arguments().contains(QLatin1String("--coreprofile"))) {
        QSurfaceFormat fmt;
        fmt.setVersion(4, 4);
        fmt.setProfile(QSurfaceFormat::CoreProfile);
        QSurfaceFormat::setDefaultFormat(fmt);
    }

    FileModel model;
    model.initDav(DAV_URL, DAV_USER, DAV_PASS);
    model.loadFromDir("/");

    /*QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setWidth(480);
    view.setHeight(640);
    //view.setColor(QColor("black"));

    QQmlContext *ctxt = view.rootContext();
    ctxt->setContextProperty("currentFolderModel", &model);
    view.setSource(QUrl("qrc:view.qml"));*/

    QQmlApplicationEngine* engine = new QQmlApplicationEngine();
    engine->rootContext()->setContextProperty("currentFolderModel", &model);
    engine->load(QUrl(QStringLiteral("qrc:///view.qml")));

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine->rootObjects().at(0));
    QObject::connect(window, SIGNAL(itemSelected(int)),
                         &model, SLOT(loadFolder(int)));

    return app.exec();

    /*view.show();
    return app.exec();*/
}
