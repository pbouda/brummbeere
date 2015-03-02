#include <QNetworkReply>

#include "owncloudclient.h"
#include "qwebdav.h"

OwncloudClient::OwncloudClient(QString owncloudUrl,
                               QString owncloudLogin,
                               QString owncloudPassword,
                               QObject *parent) : QObject(parent)
{
    mDavUrl = QString(owncloudUrl);
    if (!mDavUrl.endsWith("/"))
        mDavUrl += "/";
    mDavUrl = mDavUrl + "remote.php/webdav";
    mDavClient = new QWebDAV(this);
    mDavClient->initialize(mDavUrl, owncloudLogin, owncloudPassword);
}

OwncloudClient::~OwncloudClient()
{

}

QStringList OwncloudClient::list(QString path)
{
    QNetworkReply* reply = mDavClient->list(path);
    QString listContent = QString::fromUtf8(reply->readAll());
    qWarning() << listContent;
    QStringList ret;
    return ret;
}
