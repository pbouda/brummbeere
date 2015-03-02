#ifndef OWNCLOUDCLIENT_H
#define OWNCLOUDCLIENT_H

#include <QObject>

class QWebDAV;

class OwncloudClient : public QObject
{
    Q_OBJECT
public:
    explicit OwncloudClient(QString owncloudUrl,
                            QString owncloudLogin,
                            QString owncloudPassword,
                            QObject *parent = 0);
    ~OwncloudClient();

    QStringList list(QString path);

signals:
    void directoryListingReady(QList<QWebDAV::FileInfo>);

public slots:
    void slotFinished(QNetworkReply*);

private:
    QWebDAV* mDavClient;
    QString mDavUrl;
};

#endif // OWNCLOUDCLIENT_H
