#include <QtTest/QtTest>
#include "owncloudclient.h"

class TestOwncloudClient: public QObject
{
    Q_OBJECT
private slots:
    void list();
};

void TestOwncloudClient::list()
{
    OwncloudClient *client = new OwncloudClient();
    //QString str = "Hello";
    //QCOMPARE(str.toUpper(), QString("HELLO"));
}

QTEST_MAIN(TestOwncloudClient)
#include "testowncloudclient.moc"
