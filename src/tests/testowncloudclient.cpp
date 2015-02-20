#include <QtTest/QtTest>
#include "owncloudclient.h"
#include "config.h"

class TestOwncloudClient: public QObject
{
    Q_OBJECT
private slots:
    void mkdir();
};

void TestOwncloudClient::mkdir()
{
    OwncloudClient *client = new OwncloudClient(
                OWNCLOUD_URL,
                OWNCLOUD_LOGIN,
                OWNCLOUD_PASSWORD);
    client->mkdir(OWNCLOUD_TESTROOT);
    //QString str = "Hello";
    //QCOMPARE(str.toUpper(), QString("HELLO"));
}

QTEST_MAIN(TestOwncloudClient)
#include "testowncloudclient.moc"
