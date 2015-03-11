#include <QGuiApplication>
#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>

#include "filemodel.h"
#include "qwebdav.h"

QString DAV_URL("https://localhost");
QString DAV_USER("test");
QString DAV_PASS("password");

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    FileModel model;
    //model.addFile(File("Music", "folder.jpg"));
    //model.addFile(File("Documents", "folder.jpg"));
    //model.addFile(File("tst.mp3", "file.jpg"));

    QString mDavUrl = DAV_URL;
    if (!mDavUrl.endsWith("/"))
        mDavUrl += "/";
    mDavUrl = mDavUrl + "remote.php/webdav";
    QWebDAV* mDavClient = new QWebDAV();

    // Connect to QWebDAV signals
    /*connect(mDavClient,SIGNAL(directoryListingError(QString)),
        this, SLOT(directoryListingError(QString)));*/
    QObject::connect(mDavClient, SIGNAL(directoryListingReady(QList<QWebDAV::FileInfo>)),
        &model, SLOT(addDavFiles(QList<QWebDAV::FileInfo>)));

    mDavClient->initialize(mDavUrl, DAV_USER, DAV_PASS);
    mDavClient->list("/");

    QQuickView view;
    //view.setResizeMode(QQuickView::SizeRootObjectToView);
    QQmlContext *ctxt = view.rootContext();
    ctxt->setContextProperty("currentFolderModel", &model);

    //QQmlApplicationEngine engine;
    //engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    view.setSource(QUrl("qrc:view.qml"));
    view.show();

    return app.exec();
}
