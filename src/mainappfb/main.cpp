#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QSettings>

#include "filemodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    FileModel model;

    //QQmlApplicationEngine engine;
    QQmlApplicationEngine* engine = new QQmlApplicationEngine();

    engine->rootContext()->setContextProperty("currentFolderModel", &model);
    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));

    QQuickWindow* window = qobject_cast<QQuickWindow*>(engine->rootObjects().at(0));
    //QObject::connect(window, SIGNAL(itemSelected(int)),
    //                     &model, SLOT(loadFolder(int)));

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

    window->setMinimumHeight(640);
    window->setMinimumWidth(480);
    return app.exec();
}
