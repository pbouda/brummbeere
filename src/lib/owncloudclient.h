#ifndef OWNCLOUDCLIENT_H
#define OWNCLOUDCLIENT_H

#include <QObject>

class OwncloudClient : public QObject
{
    Q_OBJECT
public:
    explicit OwncloudClient(QObject *parent = 0);
    ~OwncloudClient();

signals:

public slots:
};

#endif // OWNCLOUDCLIENT_H
