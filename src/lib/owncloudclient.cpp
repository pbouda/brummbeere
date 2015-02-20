#include <QNetworkReply>

#include "owncloudclient.h"
#include "qwebdav.h"

OwncloudClient::OwncloudClient(QString owncloudUrl,
                               QString owncloudLogin,
                               QString owncoudPassword,
                               QObject *parent) : QObject(parent)
{

}

OwncloudClient::~OwncloudClient()
{

}

QNetworkReply* OwncloudClient::mkdir(QString path)
{
    return NULL;
}
