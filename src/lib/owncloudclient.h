#ifndef OWNCLOUDCLIENT_H
#define OWNCLOUDCLIENT_H

#include <QObject>

class QNetworkReply;

class OwncloudClient : public QObject
{
    Q_OBJECT
public:
    explicit OwncloudClient(QString owncloudUrl,
                            QString owncloudLogin,
                            QString owncoudPassword,
                            QObject *parent = 0);
    ~OwncloudClient();

    QNetworkReply* mkdir(QString path);

signals:

public slots:
};

#endif // OWNCLOUDCLIENT_H
