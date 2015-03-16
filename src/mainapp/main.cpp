//#include <QGuiApplication>

#include "qtquickcontrolsapplication.h"
#include <QtQml/QQmlApplicationEngine>
#include <QtGui/QSurfaceFormat>
#include <QQmlContext>
#include <QQuickWindow>
#include <QSettings>
#include <QtQuickWidgets/QQuickWidget>

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

    QQmlApplicationEngine* engine = new QQmlApplicationEngine();
    engine->rootContext()->setContextProperty("currentFolderModel", &model);
    engine->load(QUrl(QStringLiteral("qrc:///view.qml")));

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine->rootObjects().at(0));
    QObject::connect(window, SIGNAL(itemSelected(int)),
                         &model, SLOT(loadFolder(int)));

    // Load ownCloud or settings dialogue
    QSettings settings("peterbouda.eu", "TwoMusic");
    QString davUrl = settings.value("url").toString();
    QString davUser = settings.value("user").toString();
    QString davPass = settings.value("password").toString();
    if (davUrl.isEmpty() || davUser.isEmpty() || davPass.isEmpty()) {
        // TODO: show settings dialog

        //QQuickWidget* dialog = window->findChild<QQuickWidget *>("settingsDialog");
        //qDebug() << dialog;
        //dialog->show();
    } else {
        model.initDav(davUrl, davUser, davPass);
        model.loadFromDir("/");
    }


    return app.exec();

    /*view.show();
    return app.exec();*/
}
