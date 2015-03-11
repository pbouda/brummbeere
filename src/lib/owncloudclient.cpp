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

    // Connect to QWebDAV signals
   connect(mDavClient,SIGNAL(directoryListingError(QString)),
   this, SLOT(directoryListingError(QString)));
   connect(mDavClient,SIGNAL(directoryListingReady(QList<QWebDAV::FileInfo>)),
   this, SLOT(processDirectoryListing(QList<QWebDAV::FileInfo>)));

    mDavClient->initialize(mDavUrl, owncloudLogin, owncloudPassword);
}

OwncloudClient::~OwncloudClient()
{

}

QNetworkReply* OwncloudClient::list(QString path)
{
    QNetworkReply* reply = mDavClient->list(mDavUrl + path);
    return reply;
}

void OwncloudClient::directoryListingError(QString url)
{
}

void OwncloudClient::processDirectoryListing(QList<QWebDAV::FileInfo> fileInfo)
{
}
